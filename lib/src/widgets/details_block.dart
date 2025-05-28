import 'package:flutter/material.dart';

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
    return Column(
      children: [
        // Daily Exercise Container
        Container(
          width: 319,
          height: 173,
          padding: const EdgeInsets.all(12.76),
          decoration: ShapeDecoration(
            color: const Color(0xFFFFF8CB),
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 1.59,
                color: Color(0xFF001428),
              ),
              borderRadius: BorderRadius.circular(19.14),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0xFF001428),
                blurRadius: 0,
                offset: Offset(1.59, 3.19),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 38.88,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 261.59,
                      child: Text(
                        'Daily Exercise',
                        style: TextStyle(
                          color: const Color(0xFF001428),
                          fontSize: 24,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w700,
                          height: 1.33,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 19.14,
                      height: 19.14,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: 280,
                height: 63,
                decoration: const BoxDecoration(color: Color(0x00FFFCE6)),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 6.38),
                        SizedBox(
                          width: 226,
                          height: 26,
                          child: Text(
                            'Activity calories: $activityCalories kcal',
                            style: const TextStyle(
                              color: Color(0xFF4AA250),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const SizedBox(width: 6.38),
                        SizedBox(
                          width: 192,
                          height: 24,
                          child: Text(
                            'Activity hours: $activityHours hours',
                            style: const TextStyle(
                              color: Color(0xFF4AA250),
                              fontSize: 16,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20), 

        //water
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 164,
              padding: const EdgeInsets.all(12.76),
              decoration: ShapeDecoration(
                color: const Color(0xFFFFF8CB),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1.59,
                    color: Color(0xFF001428),
                  ),
                  borderRadius: BorderRadius.circular(19.14),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0xFF001428),
                    blurRadius: 0,
                    offset: Offset(1.59, 3.19),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Water Intake',
                      style: TextStyle(
                        color: Color(0xFF001428),
                        fontSize: 19.14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 1.33,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6.38),
                  SizedBox(
                    width: double.infinity,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$waterIntake ',
                            style: const TextStyle(
                              color: Color(0xFF4AA350),
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w700,
                              height: 1.70,
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
                  ),
                ],
              ),
            ),

            // Steps
            Container(
              width: 136,
              padding: const EdgeInsets.all(12.76),
              decoration: ShapeDecoration(
                color: const Color(0xFFFFF8CB),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 1.59,
                    color: Color(0xFF001428),
                  ),
                  borderRadius: BorderRadius.circular(19.14),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0xFF001428),
                    blurRadius: 0,
                    offset: Offset(1.59, 3.19),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Steps',
                      style: TextStyle(
                        color: Color(0xFF001428),
                        fontSize: 19.14,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 1.33,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6.38),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      stepsCount,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Color(0xFF4AA350),
                        fontSize: 20,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700,
                        height: 1.70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}