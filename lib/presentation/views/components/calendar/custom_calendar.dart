import 'package:flutter/material.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';

class CustomCalendar extends StatefulWidget {
  final DateTime? selectedDay;
  final ValueChanged<DateTime>? onDaySelected;
  final VoidCallback? onSearchTap;
  final VoidCallback? onAddTap;

  const CustomCalendar({
    super.key,
    this.selectedDay,
    this.onDaySelected,
    this.onSearchTap,
    this.onAddTap,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late DateTime _selectedDay;
  late DateTime _weekStart;

  final months = const [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  final weekDays = const ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  @override
  void initState() {
    super.initState();

    _selectedDay = widget.selectedDay ?? DateTime(2026, 8, 25);
    _weekStart = _selectedDay.subtract(Duration(days: _selectedDay.weekday % 7));
  }

  void _nextWeek() {
    setState(() {
      _weekStart = _weekStart.add(const Duration(days: 7));
    });
  }

  void _previousWeek() {
    setState(() {
      _weekStart = _weekStart.subtract(const Duration(days: 7));
    });
  }

  String _weekdayFull(DateTime date) {
    const full = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return full[date.weekday - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 28),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(34)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  IconButton(onPressed: _previousWeek, icon: const Icon(Icons.chevron_left)),
                  Expanded(
                    child: Center(
                      child: Text(
                        '${months[_selectedDay.month - 1]} - ${_selectedDay.year}',
                        style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  IconButton(onPressed: _nextWeek, icon: const Icon(Icons.chevron_right)),
                ],
              ),

              const SizedBox(height: 18),

              Row(
                children: List.generate(7, (i) {
                  final date = _weekStart.add(Duration(days: i));

                  final selected =
                      date.year == _selectedDay.year &&
                      date.month == _selectedDay.month &&
                      date.day == _selectedDay.day;

                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDay = date;
                        });
                        widget.onDaySelected?.call(date);
                      },
                      child: Column(
                        children: [
                          Text(
                            weekDays[i],
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: selected ? AppColors.primary : Colors.transparent,
                              boxShadow: selected
                                  ? [
                                      BoxShadow(
                                        color: AppColors.primary.withOpacity(0.25),
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                        offset: const Offset(0, 10),
                                      ),
                                    ]
                                  : [],
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              "${date.day}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: selected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '${_weekdayFull(_selectedDay)} - ${_selectedDay.day} '
                  '${months[_selectedDay.month - 1]}',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              GestureDetector(
                onTap: widget.onSearchTap,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.search, color: Colors.black87),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: widget.onAddTap,
                child: Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.4),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
