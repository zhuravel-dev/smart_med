import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_med/presentation/config/theme/app_colors.dart';

class SmartMedNavigationBar extends StatefulWidget {
  final int initialTabIndex;
  final PageController pageController;

  const SmartMedNavigationBar({
    super.key,
    required this.initialTabIndex,
    required this.pageController,
  });

  @override
  State<SmartMedNavigationBar> createState() =>
      SmartMedNavigationBarState();
}

class SmartMedNavigationBarState extends State<SmartMedNavigationBar> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();

    _currentIndex = widget.initialTabIndex;

    widget.pageController.addListener(_pageListener);
  }

  @override
  void dispose() {
    widget.pageController.removeListener(_pageListener);
    super.dispose();
  }

  void _pageListener() {
    final page = widget.pageController.page?.round() ?? 0;

    if (page != _currentIndex) {
      setState(() {
        _currentIndex = page;
      });
    }
  }

  void jumpToTab(int index) {
    if (index == _currentIndex) return;

    widget.pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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
          color: _isActive
              ? AppColors.navItemActive
              : const Color(0xFF353537),
          shape: BoxShape.circle,
        ),
        child: Center(child: icon),
      ),
    );
  }
}