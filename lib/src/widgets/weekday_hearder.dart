import 'package:flutter/material.dart';

class WeekdayHeaderRow extends StatelessWidget {
  const WeekdayHeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        WeekdayItem(weekday: 'MON', width: 35.5),
        WeekdayItem(weekday: 'TUE', width: 27.89),
        WeekdayItem(weekday: 'WED', width: 35.5),
        WeekdayItem(weekday: 'THU', width: 30.43),
        WeekdayItem(weekday: 'FRI', width: 22.82),
        WeekdayItem(weekday: 'SAT', width: 27.05),
        WeekdayItem(weekday: 'SUN', width: 30.43),
      ],
    );
  }
}

class WeekdayItem extends StatelessWidget {
  final String weekday;
  final double width;
  
  const WeekdayItem({
    Key? key,
    required this.weekday,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
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