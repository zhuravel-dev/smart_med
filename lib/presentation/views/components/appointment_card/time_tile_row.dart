import 'package:flutter/material.dart';
import 'package:smart_med/presentation/views/components/appointment_card/time_tile_item.dart';

class TimeTileRow extends StatelessWidget {
  final List<String> times;
  final String selectedTime;
  final ValueChanged<String> onTimeSelected;

  const TimeTileRow({
    super.key,
    required this.times,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: times.map((time) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: TimeTileItem(
              time: time,
              isSelected: selectedTime == time,
              onTap: () => onTimeSelected(time),
            ),
          ),
        );
      }).toList(),
    );
  }
}
