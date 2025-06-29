import 'package:assignment1/src/shared/app_colors.dart';
import 'package:assignment1/src/shared/app_effects.dart';
import 'package:assignment1/src/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    final loc = AppLocalizations.of(context)!;
    return Column(
      children: [
        // Daily Exercise Container (full width)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.secondarySolid10,
            borderRadius: BorderRadius.circular(19.14),
            border: Border.all(
              color: const Color(0xFF001428),
              width: 1.59,
            ),
            boxShadow: const [
             AppEffectStyles.cardShadowEffect
            ],
          ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                loc.dailyExerciseTitle,
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
                "${loc.activityCaloriesLabel}: $activityCalories ",
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
                "${loc.activityHoursLabel}: $activityHours ${loc.hoursSuffix}",
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
                  height: 100,
                  padding: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: AppColors.secondarySolid10,
                    borderRadius: BorderRadius.circular(19.14),
                    border: Border.all(
                      color: const Color(0xFF001428),
                      width: 1.59,
                    ),
                    boxShadow: const [
                      AppEffectStyles.cardShadowEffect
                    ],
                  ),
                  child: Column(
                    children: [
                       Text(
                        loc.waterIntake,
                        style: SubtitleStyle
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
                             TextSpan(
                               text: loc.mlUnit,
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
                  height: 100,
                  padding: const EdgeInsets.all(12.76),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF8CB),
                    borderRadius: BorderRadius.circular(19.14),
                    border: Border.all(
                      color: const Color(0xFF001428),
                      width: 1.59,
                    ),
                    boxShadow: const [
                      AppEffectStyles.cardShadowEffect
                    ],
                  ),
                  child: Column(
                    children: [
                      Text(
                        loc.stepsLabel,
                          style: SubtitleStyle
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
