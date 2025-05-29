import 'package:assignment1/src/shared/app_colors.dart';
import 'package:flutter/material.dart';

import 'box_text.dart';

class FitnessStatsContainer extends StatelessWidget {
  final String activityCalories;
  final String activityHours;
  final String waterIntake;
  final String stepsCount;

  const FitnessStatsContainer({
    super.key,
    required this.activityCalories,
    required this.activityHours,
    required this.waterIntake,
    required this.stepsCount,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        // Daily Exercise Container (full width)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFFFF8CB),
            borderRadius: BorderRadius.circular(19.14),
            border: Border.all(
              color: const Color(0xFF001428),
              width: 1.59,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF001428),
                blurRadius: 0,
                offset: Offset(1.59, 3.19),
              ),
            ],
          ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Daily Exercise',
                style: const TextStyle(
                  color: Color(0xFF001428),
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  height: 1.33,
                ),
              ),
              const SizedBox(height: 15),


              Text(
                'Activity calories: $activityCalories kcal',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF4AA350),
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  height: 1.7,
                ),
              ),

              const SizedBox(height: 10),
              Text(
                'Activity hours: $activityHours hours',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF4AA350),
                  fontSize: 20,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  height: 1.7,
                ),
              ),


            ],
          ),
        ),

        const SizedBox(height: 30),

        // Water & Steps Row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              // Water
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12.76),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8CB),
                    borderRadius: BorderRadius.circular(19.14),
                    border: Border.all(
                      color: const Color(0xFF001428),
                      width: 1.59,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF001428),
                        blurRadius: 0,
                        offset: Offset(1.59, 3.19),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Water Intake',
                        style: TextStyle(
                          color: Color(0xFF001428),
                          fontSize: 19.14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          height: 1.33,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '$waterIntake ',
                              style: const TextStyle(
                                color: Color(0xFF4AA350),
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight:FontWeight.w700,
                                height: 1.7,
                              ),
                            ),
                            const TextSpan(
                              text: 'mL',
                              style: TextStyle(
                                color: Color(0xFF4AA350),
                                fontSize: 14,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(width: 20),

              // Steps
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12.76),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8CB),
                    borderRadius: BorderRadius.circular(19.14),
                    border: Border.all(
                      color: const Color(0xFF001428),
                      width: 1.59,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF001428),
                        blurRadius: 0,
                        offset: Offset(1.59, 3.19),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Steps',
                        style: TextStyle(
                          color: Color(0xFF001428),
                          fontSize: 19.14,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          height: 1.33,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        stepsCount,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFF4AA350),
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          height: 1.7,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
