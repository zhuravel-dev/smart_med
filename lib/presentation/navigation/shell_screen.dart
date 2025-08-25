import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/presentation/views/home_screen.dart';
import 'package:smart_med/presentation/views/appointment_screen.dart';
import 'package:smart_med/presentation/views/history_screen.dart';

class ShellScreen extends StatelessWidget {
  final BeamState routerState;
  const ShellScreen({super.key, required this.routerState});

  @override
  Widget build(BuildContext context) {
    final initialTabIndex = _getTabIndex(routerState.queryParameters['tab']);
    print("ShellScreen: Initial tab index: $initialTabIndex, Route: ${routerState.uri}");
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
          Center(child: Text("Profile")),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: initialTabIndex,
        onTap: (index) {
          print("Switching to tab: ${_tabs[index]}");
          pageController.jumpToPage(index);
          context.beamToNamed('/?tab=${_tabs[index]}');
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "Appointments",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: "History"),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: "Articles",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }

  static const _tabs = [
    "home",
    "appointments",
    "history",
    "articles",
    "profile",
  ];

  int _getTabIndex(String? parameter) {
    print("Tab parameter: $parameter");
    final index = _tabs.indexWhere((tab) => tab == (parameter ?? 'home'));
    return index == -1 ? 0 : index;
  }
}
