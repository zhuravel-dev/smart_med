import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class ShellScreen extends StatelessWidget {
  final BeamState routerState;
  const ShellScreen({super.key, required this.routerState});

  @override
  Widget build(BuildContext context) {
    final initialTabIndex = _getTabIndex(routerState.queryParameters['tab']);
    final pageController = PageController(initialPage: initialTabIndex);

    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          // TODO add screens
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: initialTabIndex,
        onTap: (index) {
          pageController.jumpToPage(index);
          context.beamToNamed('/?tab=${_tabs[index]}');
        },
        items: const [
          // TODO add screens
        ],
      ),
    );
  }

  static const _tabs = ["home", "appointments", "history", "articles", "profile"];

  int _getTabIndex(String? parameter) {
    final index = _tabs.indexWhere((tab) => tab == parameter);
    return index == -1 ? 0 : index;
  }
}
