import 'package:flutter/material.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';
import 'package:smart_med/presentation/views/components/home_greeting_header.dart';
import 'package:smart_med/presentation/views/components/make_appointment_title.dart';
import 'package:smart_med/presentation/views/components/tags_row.dart';
import 'package:smart_med/presentation/views/doctor/list_of_doctors.dart';

class AppointmentScreen extends StatefulWidget {
  final ValueChanged<bool>? onScrollDirectionChanged;

  const AppointmentScreen({super.key, this.onScrollDirectionChanged});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
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
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: true,
        child: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            _onScroll(notification);
            return false;
          },
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
            children: [
              const SizedBox(height: 8),
              HomeGreetingHeader(),
              const SizedBox(height: 20),
              makeTitle(firstText: 'Find your doctor'),
              const SizedBox(height: 16),
              TagsRow(),
              const SizedBox(height: 16),
              ListOfDoctors(),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
