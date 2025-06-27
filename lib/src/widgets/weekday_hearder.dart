import 'package:flutter/material.dart';

class WeekdayHeaderRow extends StatelessWidget {
  const WeekdayHeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const weekdays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0), // 控制整体左右边距，适配日历
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: weekdays
            .map((day) =>  Expanded(
          child: WeekdayItem(weekday: day),
        ))
            .toList(),
      ),
    );
  }
}

class WeekdayItem extends StatelessWidget {
  final String weekday;

  const WeekdayItem({
    Key? key,
    required this.weekday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        weekday,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
