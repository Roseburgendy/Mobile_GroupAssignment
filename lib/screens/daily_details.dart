import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../src/widgets/back_button.dart';
import '../../src/widgets/details_block.dart';
import '../../src/widgets/last_next_button.dart';

class DailyDetailsScreen extends StatefulWidget {
  final DateTime selectedDate;

  const DailyDetailsScreen({super.key, required this.selectedDate});

  @override
  State<DailyDetailsScreen> createState() => _DailyDetailsScreenState();
}

class _DailyDetailsScreenState extends State<DailyDetailsScreen> {
  late DateTime currentDate;

  // example data
  String currentWeight = '60.2kg';
  String weightLost = '20kg';
  String caloriesBurned = '1000kcal';
  String waterIntake = '1000';
  String stepsCount = '12000';

  @override
  void initState() {
    super.initState();
    currentDate = widget.selectedDate;
    _loadDataForDate(currentDate);
  }

  void _loadDataForDate(DateTime date) {

    setState(() {

      currentWeight = '60.${date.day}kg';
      weightLost = '${20 + date.day}kg';
      caloriesBurned = '${1000 - date.day * 5}kcal';
      waterIntake = '${1000 + date.day * 10}';
      stepsCount = '${12000 + date.day * 3}';
    });
  }

  /*void _loadDataForDate(DateTime date) async {
  final data = await DatabaseService.getDailyStats(date); // 示例
  setState(() {
    currentWeight = data.weight;
    weightLost = data.weightLost;
    caloriesBurned = data.calories;
    waterIntake = data.water;
    stepsCount = data.steps;
  });
}*/


  void _goToPreviousDay() {
    setState(() {
      currentDate = currentDate.subtract(const Duration(days: 1));
      _loadDataForDate(currentDate);
    });
  }

  void _goToNextDay() {
    setState(() {
      currentDate = currentDate.add(const Duration(days: 1));
      _loadDataForDate(currentDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat('EEEE, MMMM d').format(currentDate);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFFEFDFA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 32),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: screenHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: ShapeDecoration(
                    color: const Color(0x99009D0A),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(width: 2),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0xFFA2D2FF),
                        blurRadius: 0,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          AnalysisIconButton(
                            imagePath: 'assets/icon/arrow-left.svg',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xFF001428),
                                width: 1.5,
                              ),
                            ),
                            child: Text(
                              formattedDate,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const Spacer(flex: 2),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: Container(
                          width: 128,
                          height: 120,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFFFEE99),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFF001428),
                                offset: Offset(2, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              currentWeight,
                              style: const TextStyle(
                                color: Color(0xFF003D04),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text('LOST',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF003D04),
                                    )),
                                const SizedBox(height: 8),
                                Text(weightLost,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF006B07),
                                    )),
                              ],
                            ),
                            Column(
                              children: [
                                const Text('BURNED',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF003D04),
                                    )),
                                const SizedBox(height: 8),
                                Text(caloriesBurned,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF006B07),
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: FitnessStatsContainer(
                    activityCalories: caloriesBurned,
                    activityHours: '2',
                    waterIntake: waterIntake,
                    stepsCount: stepsCount,
                  ),
                ),

                const SizedBox(height: 48),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NavigationButton(
                        text: 'Last',
                        isNextButton: false,
                        onPressed: _goToPreviousDay, 
                      ),
                      NavigationButton(
                        text: 'Next',
                        isNextButton: true,
                        onPressed: _goToNextDay,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
