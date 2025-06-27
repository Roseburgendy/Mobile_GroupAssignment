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

class MyLogScreen extends StatefulWidget {
  const MyLogScreen({Key? key}) : super(key: key);

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

  bool _checkedRefresh = false;

  @override
  void initState() {
    super.initState();
    _loadWeeklyData();
  }

  Future<void> _checkForUpdates() async {
    final prefs = await SharedPreferences.getInstance();
    final shouldRefresh = prefs.getBool('shouldRefreshMyLog') ?? false;

    if (shouldRefresh) {
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
      _weeklyData = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    int daysInMonth(DateTime date) {
      final firstDayNextMonth = (date.month < 12)
          ? DateTime(date.year, date.month + 1, 1)
          : DateTime(date.year + 1, 1, 1);
      return firstDayNextMonth.subtract(const Duration(days: 1)).day;

      if (!_checkedRefresh) {
        _checkedRefresh = true;
        _checkForUpdates();
      }
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
                        child: Text('当前用户: $_username',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                    const CalendarTitle(title: 'My Calendar', width: 327),
                    const SizedBox(height: 24),
                    const WeekdayHeaderRow(),
                    const SizedBox(height: 24),
                    CalendarDateButtons(
                      daysInMonth: totalDays,
                      firstDayOffset: 0,
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
                      selectedDay: _selectedDate?.day,
                    ),
                    const SizedBox(height: 32),
                    InteractiveWeeklyChart(datasets: _weeklyData),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
      ),
    );
  }
}
