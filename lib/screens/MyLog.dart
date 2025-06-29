import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assignment1/services/database_service.dart';
import 'package:assignment1/main.dart'; 
import '../src/shared/styles.dart';
import '../src/widgets/calendar_title.dart';
import '../src/widgets/weekday_hearder.dart';
import '../src/widgets/calendar.dart';
import '../src/widgets/weekly_bar_chart.dart';
import '../src/widgets/custom_bottom_nav_bar.dart';
import './daily_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assignment1/database/db_helper_healthdata.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class MyLogScreen extends StatefulWidget {
  const MyLogScreen({Key? key}) : super(key: key);

  static final GlobalKey<_MyLogScreenState> myLogKey = GlobalKey();

  @override
  State<MyLogScreen> createState() => _MyLogScreenState();
}

class _MyLogScreenState extends State<MyLogScreen> {
  int _currentIndex = 1;
  DateTime? _selectedDate;

  List<List<double>> _weeklyData = [
    List.filled(7, 0.0),
    List.filled(7, 0.0),
  ];

  bool _isLoading = true;
  String? _username;
  int? _userId;

  bool _checkedRefresh = false;

  DateTime _currentMonth = DateTime.now();

  void refreshData() {
    _checkForUpdates();
  }

  @override
  void initState() {
    super.initState();
    _loadWeeklyData();
    _loadUserInfo();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkForUpdates();
    });
  }

  Future<void> _loadUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? 'Guest';
      _userId = prefs.getInt('userID');
    });
  }

  Future<void> _checkForUpdates() async {
    final prefs = await SharedPreferences.getInstance();
    final shouldRefresh = prefs.getBool('shouldRefreshMyLog') ?? false;
    print('检查 shouldRefreshMyLog: $shouldRefresh');

    if (shouldRefresh) {
      print('检测到刷新请求，重新加载周数据...');
    await _loadWeeklyData();
    await prefs.setBool('shouldRefreshMyLog', false);
    }
     }

  Future<void> _loadWeeklyData() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    if (username == null) {
      debugPrint('SharedPreferences 中没有 username，无法加载日志');
      setState(() => _isLoading = false);
      return;
    }

    _username = username;

    final dbService = DatabaseService(db); 
    final userId = await dbService.getUserIdByUsername(username);
    if (userId == null) {
      debugPrint('未找到用户 $username 的 ID');
      setState(() => _isLoading = false);
      return;
    }

    final data = await dbService.getWeeklyHealthData(userId);
    setState(() {
      _weeklyData = [
        List.from(data[0]),
        List.from(data[1]),
      ];
      _isLoading = false;
    });
  }

  int get _daysInCurrentMonth {
    final firstDayNextMonth = (_currentMonth.month < 12)
        ? DateTime(_currentMonth.year, _currentMonth.month + 1, 1)
        : DateTime(_currentMonth.year + 1, 1, 1);
    return firstDayNextMonth.subtract(const Duration(days: 1)).day;
  }

  void _handleVerticalSwipe(DragEndDetails details) {
    final velocity = details.primaryVelocity ?? 0;

    setState(() {
      if (velocity < 0) {
        // 上滑 → 上个月
        _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
      } else if (velocity > 0) {
        // 下滑 → 下个月
        _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    int daysInMonth(DateTime date) {
      final firstDayNextMonth = (date.month < 12)
          ? DateTime(date.year, date.month + 1, 1)
          : DateTime(date.year + 1, 1, 1);
      return firstDayNextMonth.subtract(const Duration(days: 1)).day;
    }

    final now = DateTime.now();
    final totalDays = daysInMonth(now);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Log', style: Headline4Style),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    if (_username != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text('当前用户: $_username (ID:$_userId)',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                    const CalendarTitle(title: 'My Calendar', width: 327),
                    const SizedBox(height: 24),
                    // 新增：当前年月标题
                    Center(
                      child: Text(
                        '${_currentMonth.year}年 ${_currentMonth.month}月',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    const WeekdayHeaderRow(),
                    const SizedBox(height: 24),

                    // 新增：包裹手势识别器
                    GestureDetector(
                      onVerticalDragEnd: _handleVerticalSwipe,
                      child: CalendarDateButtons(
                        year: _currentMonth.year,
                        month: _currentMonth.month,
                        daysInMonth: _daysInCurrentMonth,
                        selectedDay: (_selectedDate?.year == _currentMonth.year &&
                            _selectedDate?.month == _currentMonth.month)
                            ? _selectedDate?.day
                            : null,
                        onDayPressed: (DateTime selectedDate) {
                          setState(() {
                            _selectedDate = selectedDate;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DailyDetailsScreen(
                                selectedDate: selectedDate,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 32),
                    InteractiveWeeklyChart(
                      key: ValueKey(_weeklyData.map((list) => list.join(',')).join('|')),
                      datasets: _weeklyData,
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
      ),
    );



  }
}
