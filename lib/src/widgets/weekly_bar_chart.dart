import 'package:flutter/material.dart';

class InteractiveWeeklyChart extends StatefulWidget {
  final List<List<double>> datasets;

 InteractiveWeeklyChart({
    Key? key,
    required this.datasets,
  })  : assert(datasets.length == 2),
        assert(datasets[0].length == 7 && datasets[1].length == 7),
        super(key: key);

  @override
  _InteractiveWeeklyChartState createState() => _InteractiveWeeklyChartState();
}

class _InteractiveWeeklyChartState extends State<InteractiveWeeklyChart> {
  int selectedOption = 0;

  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  @override
  Widget build(BuildContext context) {
    final data = widget.datasets[selectedOption];
    final maxData = (data.isNotEmpty ? data.reduce((a, b) => a > b ? a : b) : 1);

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          Text(
            'Recent Week',
            style: TextStyle(
              color: const Color(0xFF001428),
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w700,
              height: 1.7,
            ),
          ),
          const SizedBox(height: 16),

          // button
          Row(
            children: [
              buildOptionButton(0, 'Cal'),
              const SizedBox(width: 13),
              buildOptionButton(1, 'Water'),
            ],
          ),
          const SizedBox(height: 34),

          // bar chart
          Container(
            height: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(7, (index) {
                final heightRatio = data[index] / (maxData == 0 ? 1 : maxData);
                final barHeight = heightRatio * 142.0;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 16,
                      height: barHeight,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFDD00),
                        borderRadius: BorderRadius.circular(41),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      days[index],
                      style: TextStyle(
                        color: const Color(0xFF001428),
                        fontSize: 12,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOptionButton(int index, String label) {
    final isSelected = selectedOption == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: ShapeDecoration(
          color: isSelected ? const Color(0xFF006B07) : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              width: isSelected ? 1 : 0,
              color: isSelected ? const Color(0xFF001428) : Colors.transparent,
            ),
          ),
          shadows: isSelected
              ? [
                  BoxShadow(
                    color: Color(0xFF001428),
                    blurRadius: 0,
                    offset: Offset(1, 2),
                    spreadRadius: 0,
                  ),
                ]
              : [],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xFF001428),
            fontSize: 16,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
