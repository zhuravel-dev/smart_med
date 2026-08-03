import 'package:flutter/material.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';
import 'package:smart_med/presentation/views/components/custom_app_bar/greeting_header.dart';
import 'package:smart_med/presentation/views/components/home_greeting_header.dart';
import 'package:smart_med/presentation/views/components/main_cards_row.dart';
import 'package:smart_med/presentation/views/components/make_appointment_title.dart';
import 'package:smart_med/presentation/views/components/tags_row.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool>? onScrollDirectionChanged;
  final VoidCallback? onOpenAppointment;
  const HomeScreen({super.key, this.onScrollDirectionChanged, this.onOpenAppointment});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              GreetingHeader(type: GreetingHeaderType.main),
              const SizedBox(height: 20),
              makeTitle(firstText: 'Make an', secondText: 'Appointment'),
              const SizedBox(height: 24),
              TagsRow(),
              const SizedBox(height: 16),
              MainCardsRow(
                onOpenAppointment: widget.onOpenAppointment,
              ),
              const SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
