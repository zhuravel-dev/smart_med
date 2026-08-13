import 'dart:async';

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/presentation/navigation/app_router.dart';
import 'package:smart_med/presentation/views/screens/account_screen.dart';
import 'package:smart_med/presentation/views/screens/appointment_screen.dart';
import 'package:smart_med/presentation/views/screens/history_screen.dart';
import 'package:smart_med/presentation/views/screens/home_screen.dart';
import 'smart_med_navigation_bar.dart';

class ShellScreen extends StatefulWidget {
  final BeamState routerState;

  const ShellScreen({
    super.key,
    required this.routerState,
  });

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  late final PageController _pageController;

  bool _isNavigationBarHidden = false;

  Timer? _hideTimer;
  static const _autoHideDuration = Duration(seconds: 10);

  @override
  void initState() {
    super.initState();

    final initialTabIndex =
    _getShallTabIndex(widget.routerState.queryParameters['tab']);

    _pageController = PageController(initialPage: initialTabIndex);

    _restartHideTimer();
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _restartHideTimer() {
    _hideTimer?.cancel();

    _hideTimer = Timer(_autoHideDuration, () {
      if (!mounted || _isNavigationBarHidden) {
        return;
      }

      setState(() {
        _isNavigationBarHidden = true;
      });
    });
  }

  void _onUserInteraction() {
    if (_isNavigationBarHidden) {
      setState(() {
        _isNavigationBarHidden = false;
      });
    }

    _restartHideTimer();
  }

  void _onScrollDirectionChanged(bool isScrollingDown) {
    if (_isNavigationBarHidden != isScrollingDown) {
      setState(() {
        _isNavigationBarHidden = isScrollingDown;
      });
    }

    if (!isScrollingDown) {
      _restartHideTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    final initialTabIndex =
    _getShallTabIndex(widget.routerState.queryParameters['tab']);

    return Listener(
      behavior: HitTestBehavior.translucent,
      onPointerDown: (_) => _onUserInteraction(),
      onPointerMove: (_) => _onUserInteraction(),
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomeScreen(
                  onScrollDirectionChanged: _onScrollDirectionChanged,
                  onOpenAppointment: () {
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                AppointmentScreen(
                  onScrollDirectionChanged: _onScrollDirectionChanged,
                ),
                HistoryScreen(
                  onScrollDirectionChanged: _onScrollDirectionChanged,
                ),
                AccountScreen(
                  onScrollDirectionChanged: _onScrollDirectionChanged,
                ),
              ],
            ),
            Positioned(
              bottom: 36,
              left: 48,
              right: 48,
              child: AnimatedSlide(
                offset: _isNavigationBarHidden
                    ? const Offset(0, 1)
                    : Offset.zero,
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeInOutCubic,
                child: AnimatedOpacity(
                  opacity: _isNavigationBarHidden ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 350),
                  curve: Curves.easeInOut,
                  child: SmartMedNavigationBar(
                    initialTabIndex: initialTabIndex,
                    pageController: _pageController,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int _getShallTabIndex(String? parameter) {
    final index = AppRouter.shellTabs.indexWhere((tab) => parameter == tab);
    return index == -1 ? 0 : index;
  }
}