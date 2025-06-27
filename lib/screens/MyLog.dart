import 'package:flutter/material.dart';
<<<<<<< Updated upstream
=======
import 'package:shared_preferences/shared_preferences.dart';
import 'package:assignment1/services/database_service.dart';
import 'package:assignment1/main.dart';                   
import '../src/shared/styles.dart';
>>>>>>> Stashed changes
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

  @override
  void initState() {
    super.initState();
    _loadWeeklyData();
  }

  Future<void> _loadWeeklyData() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username'); 
    if (username == null) {
      debugPrint('SharedPreferences 中没有 username，无法加载日志');
      setState(() => _isLoading = false);
      return;
    }

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
    }

    final now = DateTime.now();
    final totalDays = daysInMonth(now);

    return Scaffold(
<<<<<<< Updated upstream
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar Section
              Center(
                child: const CalendarTitle(
                  title: 'My Log',
                  centerAlign: true,
                  width: 327,
                ),
              ),
              const SizedBox(height: 2),
              
              const CalendarTitle(
                title: 'My Calendar',
                width: 327,
              ),
              const SizedBox(height: 16),
              
              const WeekdayHeaderRow(),
              const SizedBox(height: 8),

              CalendarDateButtons(
                daysInMonth: 31,
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
=======
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
>>>>>>> Stashed changes
                    ),
                    const SizedBox(height: 32),

                    InteractiveWeeklyChart(datasets: _weeklyData),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
      ),
<<<<<<< Updated upstream
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
=======
>>>>>>> Stashed changes
    );
  }
}
