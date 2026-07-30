import 'package:flutter/material.dart';
import 'package:smart_med/infra/mocks/mock_visit_history.dart';
import 'package:smart_med/presentation/views/components/calendar/custom_calendar.dart';
import 'package:smart_med/presentation/views/components/visit_history_card.dart';

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
      appBar: AppBar(
      /*  backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.blue),
        title: const Text(
          'Visit History',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.blue),
          ),
        ],*/
      ),
      body: SafeArea(
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            _onScroll(notification);
            return false;
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomCalendar(),
                ...mockVisitHistory.map(
                  (visit) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: VisitHistoryCard(
                      doctor: 'Dr. ${visit.doctor.firstName} ${visit.doctor.lastName}',
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
        ),
      ),
    );
  }
}
