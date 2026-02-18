import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialTabIndex;
  }

  void jumpToTab(int index) {
    setState(() => _currentIndex = index);
    widget.pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF0F0F10),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavItem(
            icon: SvgPicture.asset(
              'assets/icons/house.svg',
              color: Colors.white,
              width: 24,
              height: 24,
            ),
            index: 0,
            currentIndex: _currentIndex,
            onTap: jumpToTab,
          ),

          _NavItem(
            icon: SvgPicture.asset(
              'assets/icons/search.svg',
              color: Colors.white,
              width: 24,
              height: 24,
            ),
            index: 1,
            currentIndex: _currentIndex,
            onTap: jumpToTab,
          ),

          _NavItem(
            icon: SvgPicture.asset(
              'assets/icons/calendar.svg',
              color: Colors.white,
              width: 24,
              height: 24,
            ),
            index: 2,
            currentIndex: _currentIndex,
            onTap: jumpToTab,
          ),

          _NavItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              color: Colors.white,
              width: 24,
              height: 24,
            ),
            index: 3,
            currentIndex: _currentIndex,
            onTap: jumpToTab,
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final Widget icon;
  final int index;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const _NavItem({
    required this.icon,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  bool get _isActive => index == currentIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color: _isActive ? const Color(0xFF3D7BF4) : const Color(0xFF1C1C1E),
          shape: BoxShape.circle,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
