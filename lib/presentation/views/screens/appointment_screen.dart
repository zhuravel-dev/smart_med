import 'package:flutter/material.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';
import 'package:smart_med/presentation/views/components/custom_app_bar/greeting_header.dart';
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
    if (notification is! ScrollUpdateNotification) return;
    final currentOffset = notification.metrics.pixels;
    if ((currentOffset - _lastScrollOffset).abs() < 5) return;
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final height = constraints.maxHeight;
            final horizontalPadding = width * 0.041;
            final topSpacing = height * 0.010;
            final headerSpacing = height * 0.025;
            final sectionSpacing = height * 0.020;
            final bottomSpacing = height * 0.140;

            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                _onScroll(notification);
                return false;
              },
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                children: [
                  SizedBox(height: topSpacing),
                  const GreetingHeader(type: GreetingHeaderType.main),
                  SizedBox(height: headerSpacing),
                  makeTitle(firstText: 'Find your doctor'),
                  SizedBox(height: sectionSpacing),
                  const TagsRow(),
                  SizedBox(height: sectionSpacing),
                  const ListOfDoctors(),
                  SizedBox(height: bottomSpacing),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
