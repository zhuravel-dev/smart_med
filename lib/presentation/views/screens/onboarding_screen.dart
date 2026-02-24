import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/presentation/navigation/app_router.dart';
import 'package:smart_med/presentation/views/components/buttons/onboarding_get_started_button.dart';
import 'package:smart_med/presentation/views/components/onboarding_category_chip.dart';
import 'package:smart_med_images/smart_med_images.dart';
import 'package:smart_med_strings/smart_med_strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const _titleStyle1 = TextStyle(
    color: Colors.white,
    fontSize: 34,
    fontWeight: FontWeight.w400,
    height: 1.2,
  );

  static const _titleStyle2 = TextStyle(
    color: Colors.white,
    fontSize: 36,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static const _bodyStyle = TextStyle(color: Colors.white, fontSize: 16, height: 1.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: const [_Background(), _GradientOverlay(), _Content()]));
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(child: Image.asset(SmartMedImages.onBoarding, fit: BoxFit.cover));
  }
}

class _GradientOverlay extends StatelessWidget {
  const _GradientOverlay();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.6, 1.0],
            colors: [Colors.transparent, Colors.black38, Colors.black87],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  static const _horizontalPadding = EdgeInsets.symmetric(horizontal: 24);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          const Center(child: _AppTitle()),

          const Spacer(),

          const Padding(
            padding: _horizontalPadding,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                OnBoardingCategoryChip(label: CommonStrings.categoryGeneralSurgery),
                OnBoardingCategoryChip(label: CommonStrings.categoryVascular),
                OnBoardingCategoryChip(label: CommonStrings.categorySpinal),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Padding(padding: _horizontalPadding, child: _Titles()),

          const SizedBox(height: 12),

          const Padding(
            padding: _horizontalPadding,
            child: Text(CommonStrings.onBoardingLongText, style: OnboardingScreen._bodyStyle),
          ),

          const SizedBox(height: 26),

          OnBoardingGetStartedButton(onTap: () => context.beamToNamed(AppRouter.home())),

          const SizedBox(height: 28),
        ],
      ),
    );
  }
}

class _AppTitle extends StatelessWidget {
  const _AppTitle();

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
      TextSpan(
        text: 'SmartMed\n',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
        children: [
          TextSpan(
            text: 'developed by Yuliia Zhuravel',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _Titles extends StatelessWidget {
  const _Titles();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(CommonStrings.onboardingTitle1, style: OnboardingScreen._titleStyle1),
        Text(CommonStrings.onboardingTitle2, style: OnboardingScreen._titleStyle2),
      ],
    );
  }
}
