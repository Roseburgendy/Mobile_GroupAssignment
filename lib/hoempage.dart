import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            // Top Section
            Container(
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'assets/image/homepage_logo_ruleyou.png',
                        height: 30,
                      ),
                      SvgPicture.asset(
                        'assets/icon/homepage_icon_sun.svg',
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 130,
                          height: 130,
                          child: CircularProgressIndicator(
                            value: 0.5,
                            strokeWidth: 10,
                            backgroundColor: Colors.white.withOpacity(0.3),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Colors.yellowAccent,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            const Text(
                              '60.2kg',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            SvgPicture.asset(
                              'assets/icon/homepage_icon_edit_weight.svg',
                              height: 16,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'INITIAL\n68kg',
                        style: TextStyle(color: Colors.white70),
                      ),
                      Text(
                        'GOAL\n55kg',
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Middle Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[100],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Daily Exercise',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icon/icon_calories.svg',
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Activity calories: 100 kcal',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/icon/homepage_icon_timer.svg',
                                height: 20,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'Activity hours: 2 hours',
                                style: TextStyle(color: Colors.green),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/icon/homepage_icon_arrow_right.svg',
                                height: 16,
                              ),
                              label: const Text('START'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                const Text(
                                  "Today's\nWater Intake",
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  '1000 mL',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SvgPicture.asset(
                                    'assets/icon/homepage_icon_arrow_right.svg',
                                    height: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.yellow[100],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                const Text(
                                  "Today's\nSteps",
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  '12000',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SvgPicture.asset(
                                    'assets/icon/homepage_icon_arrow_right.svg',
                                    height: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icon/homepage_icon_home_active.svg',
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icon/icon_chart.svg', height: 24),
            label: 'Chart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icon/icon_exercise.svg', height: 24),
            label: 'Exercise',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icon/icon_pet.svg', height: 24),
            label: 'Pet',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icon/icon_profile.svg', height: 24),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
