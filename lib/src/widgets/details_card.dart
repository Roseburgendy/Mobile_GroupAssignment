import 'package:flutter/material.dart';

class FitnessStatsWidget extends StatelessWidget {
  final String currentWeight;
  final String weightLost;
  final String caloriesBurned;
  final String waterIntake;
  final String stepsCount;
  final String date;
 

  const FitnessStatsWidget({
    super.key,
    required this.currentWeight,
    required this.weightLost,
    required this.caloriesBurned,
    required this.waterIntake,
    required this.stepsCount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 812,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFFEFDFA),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 3,
            color: Color(0xFF001428),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: 375,
              height: 262,
              decoration: ShapeDecoration(
                color: const Color(0x99009D0A),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2),
                  borderRadius: BorderRadius.only(
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
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),

          Positioned(
            left: 152,
            top: 32,
            child: Container(
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
                date,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  height: 1.33,
                ),
              ),
            ),
          ),
          
          Positioned(
            left: 124,
            top: 111,
            child: Container(
              width: 128,
              height: 120,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFEE99), 
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF001428),
                    blurRadius: 0,
                    offset: Offset(2, 3),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Center(
                child: Text(
                  currentWeight,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF003D04),
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 1.70,
                  ),
                ),
              ),
            ),
          ),

          // LOST
          Positioned(
            left: 36,
            top: 147,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'LOST',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF003D04),
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  weightLost,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF006B07),
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 1.70,
                  ),
                ),
              ],
            ),
          ),

          // BURNED
          Positioned(
            left: 269,
            top: 147,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'BURNED',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF003D04),
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  caloriesBurned,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF006B07),
                    fontSize: 20,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    height: 1.70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}