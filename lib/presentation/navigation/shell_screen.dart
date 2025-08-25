import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/presentation/navigation/app_router.dart';
import 'package:smart_med/presentation/navigation/smart_med_navigation_bar.dart';
import 'package:smart_med/presentation/views/home_screen.dart';
import 'package:smart_med/presentation/views/appointment_screen.dart';
import 'package:smart_med/presentation/views/history_screen.dart';

class ShellScreen extends StatelessWidget {
  final BeamState routerState;
  const ShellScreen({super.key, required this.routerState});

  @override
  Widget build(BuildContext context) {
    final initialTabIndex = _getShallTabIndex(
      routerState.queryParameters['tab'],
    );
    final pageController = PageController(initialPage: initialTabIndex);

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          HomeScreen(),
          AppointmentScreen(),
          HistoryScreen(),
          HistoryScreen(),
          HistoryScreen(),
        ],
      ),
      bottomNavigationBar: SmartMedNavigationBar(
        key: navBarKey,
        initialTabIndex: initialTabIndex,
        pageController: pageController,
      ),
    );
  }

  int _getShallTabIndex(String? parameter) {
    final index = AppRouter.shellTabs.indexWhere((tab) => parameter == tab);
    return index == -1 ? 0 : index;
  }
}
