import 'package:flutter/material.dart';

class PetPage extends StatelessWidget {
  const PetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pet House',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color(0xFF001428),
            fontSize: 24,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
            height: 1.33,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            //Hector image
            Center(
              child: Image.asset('assets/image_xjq/Hector.png', height: 150),
            ),
            const SizedBox(height: 20),

            //Hector name
            const Text(
              'Hector',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0xFF001428),
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
                height: 1.70,
              ),
            ),
            const SizedBox(height: 20),

            //Progress bar
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: LinearProgressIndicator(
                value: 3 / 5, // 收集进度（0~1之间）
                minHeight: 16,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
            ),
            const SizedBox(height: 10),

            // Progress text
            const Text(
              '3 / 5 collected',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
