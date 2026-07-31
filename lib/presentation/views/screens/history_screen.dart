import 'package:flutter/material.dart';
import 'package:smart_med/infra/mocks/mock_visit_history.dart';
import 'package:smart_med/presentation/views/components/calendar/custom_calendar.dart';
import 'package:smart_med/presentation/views/components/history_card/visit_history_card.dart';

class HistoryScreen extends StatefulWidget {
  final ValueChanged<bool>? onScrollDirectionChanged;

  const HistoryScreen({super.key, this.onScrollDirectionChanged});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  double _lastScrollOffset = 0;

  void _onScroll(ScrollNotification notification) {
    if (notification is! ScrollUpdateNotification) {
      return;
    }
    final currentOffset = notification.metrics.pixels;
    if ((currentOffset - _lastScrollOffset).abs() < 5) {
      return;
    }
    if (currentOffset <= 0) {
      widget.onScrollDirectionChanged?.call(false);
      _lastScrollOffset = currentOffset;
      return;
    }
    final isScrollingDown = currentOffset > _lastScrollOffset;
    widget.onScrollDirectionChanged?.call(isScrollingDown);
    _lastScrollOffset = currentOffset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          _onScroll(notification);
          return false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomCalendar(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Column(
                  children: [
                    ...mockVisitHistory.map(
                      (visit) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: VisitHistoryCard(
                          doctor: visit.doctor,
                          speciality: visit.doctor.specialization,
                          datetime: visit.datetime,
                          highlighted: visit.highlighted,
                        ),
                      ),
                    ),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
