import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/presentation/navigation/app_router.dart';

final navBarKey = GlobalKey<SmartMedNavigationBarState>();
void goToHomeTab() => navBarKey.currentState?._goToTab(0);

class SmartMedNavigationBar extends StatefulWidget {
  final int initialTabIndex;
  final PageController pageController;

  const SmartMedNavigationBar({
    super.key,
    required this.initialTabIndex,
    required this.pageController,
  });

  @override
  State<SmartMedNavigationBar> createState() => SmartMedNavigationBarState();
}

class SmartMedNavigationBarState extends State<SmartMedNavigationBar> {
  late int currentIndex;

  static const Map<String, IconData> buttonsMap = {
    'Home': Icons.home,
    'Appointments': Icons.calendar_month,
    'History': Icons.article,
    'Articles': Icons.menu_book,
    'Profile': Icons.person,
  };

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialTabIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.grey,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: List.generate(
        buttonsMap.length,
        (index) => BottomNavigationBarItem(
          icon: SizedBox(
            height: 23,
            child: Icon(buttonsMap.values.elementAt(index)),
          ),
          label: buttonsMap.keys.elementAt(index),
        ),
      ),
      currentIndex: currentIndex,
      onTap: _goToTab,
    );
  }

  void _goToTab(int index) {
    final tab = AppRouter.shellTabs.elementAt(index);
    Beamer.of(context).update(
      configuration: RouteInformation(
        uri: Uri(path: AppRouter.home(), queryParameters: {'tab': tab}),
      ),
      rebuild: false,
    );
    widget.pageController.jumpToPage(index);
    setState(() => currentIndex = index);
  }
}
