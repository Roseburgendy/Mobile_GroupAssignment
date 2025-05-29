import 'package:flutter/material.dart';
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
  _MyLogScreenState createState() => _MyLogScreenState();
}

class _MyLogScreenState extends State<MyLogScreen> {
  int _currentIndex = 1; 
  DateTime? _selectedDate;

  final List<List<double>> weeklyData = [
    [1200, 800, 1500, 900, 1100, 700, 1300], // Calories
    [1500, 2000, 1800, 2200, 1700, 1900, 2100], // Water (mL)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Log",
          style: Headline4Style,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Calendar Section

              const SizedBox(height: 10),
              
              const CalendarTitle(
                title: 'My Calendar',
                width: 327,
              ),
              const SizedBox(height: 24),
              
              const WeekdayHeaderRow(),
              const SizedBox(height: 24),

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
                    ),
                  );
                },
                selectedDay: _selectedDate?.day 
              ),
              const SizedBox(height: 32),

              // Weekly Chart Section
              InteractiveWeeklyChart(
                datasets: weeklyData,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),

    );
  }
}