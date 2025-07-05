import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WeekdayHeaderRow extends StatelessWidget {
  const WeekdayHeaderRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final weekdays = [
      loc.monShort,
      loc.tueShort,
      loc.wedShort,
      loc.thuShort,
      loc.friShort,
      loc.satShort,
      loc.sunShort,
    ];

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
