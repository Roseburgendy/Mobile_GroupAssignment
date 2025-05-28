import 'package:flutter/material.dart';

class CalendarDateButtons extends StatelessWidget {
  final int daysInMonth;
  final int firstDayOffset;
  final ValueChanged<DateTime> onDayPressed;
  final int? selectedDay; 
  
  const CalendarDateButtons({
    Key? key,
    required this.daysInMonth,
    this.firstDayOffset = 0,
    required this.onDayPressed,
    this.selectedDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
      itemCount: _calculateItemCount(),
      itemBuilder: (context, index) {
        if (index < firstDayOffset) {
          return const SizedBox.shrink();
        }
        final day = index - firstDayOffset + 1;
        if (day > daysInMonth) {
          return const SizedBox.shrink();
        }
        return _buildDayButton(day);
      },
    );
  }

  Widget _buildDayButton(int day) {
    final now = DateTime.now();
    final isToday = day == now.day && DateTime.now().month == now.month;
    final isSelected = day == selectedDay;
    
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        final currentDate = DateTime(now.year, now.month, day);
        onDayPressed(currentDate);
      },
      child: Container(
        decoration: ShapeDecoration(
          color: isSelected 
              ? const Color(0xFF006B07)
              : isToday 
                  ? const Color(0xFFE0F7E0)
                  : Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isSelected 
                  ? const Color(0xFF004D00)
                  : const Color(0xFF001428),
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x40001428),
              blurRadius: 2,
              offset: Offset(1, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
          child: Text(
            '$day',
            style: TextStyle(
              color: isSelected 
                  ? Colors.white 
                  : isToday 
                      ? const Color(0xFF006B07)
                      : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  int _calculateItemCount() {
    final totalWeeks = ((daysInMonth + firstDayOffset) / 7).ceil();
    return totalWeeks * 7;
  }
}