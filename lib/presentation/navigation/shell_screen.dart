import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/presentation/navigation/app_router.dart';
import 'package:smart_med/presentation/views/account/account_screen.dart';
import 'package:smart_med/presentation/views/screens/home_screen.dart';
import 'package:smart_med/presentation/views/screens/appointment_screen.dart';
import 'package:smart_med/presentation/views/screens/history_screen.dart';
import 'smart_med_navigation_bar.dart';

class ShellScreen extends StatelessWidget {
  final BeamState routerState;
  const ShellScreen({super.key, required this.routerState});

  @override
  Widget build(BuildContext context) {
    final initialTabIndex = _getShallTabIndex(routerState.queryParameters['tab']);
    final pageController = PageController(initialPage: initialTabIndex);

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              const HomeScreen(),
              AppointmentScreen(),
              const HistoryScreen(),
              AccountScreen(),
            ],
          ),
          Positioned(
            bottom: 36,
            left: 48,
            right: 48,
            child: SmartMedNavigationBar(
              initialTabIndex: initialTabIndex,
              pageController: pageController,
            ),
          ),
        ],
      ),
    );
  }

  int _getShallTabIndex(String? parameter) {
    final index = AppRouter.shellTabs.indexWhere((tab) => parameter == tab);
    return index == -1 ? 0 : index;
  }
}
