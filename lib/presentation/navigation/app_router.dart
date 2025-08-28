import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/presentation/navigation/shell_screen.dart';
import 'package:smart_med/presentation/views/account/payment_screen.dart';
import 'package:smart_med/presentation/views/authentication/sign_up_screen.dart';
import 'package:smart_med/presentation/views/authentication/sing_in_screen.dart';
import 'package:smart_med/presentation/views/onboarding_screen.dart';

class AppRouter {
  static GlobalKey<NavigatorState>? _navigatorKey;

  static const String _shell = 'shell';
  static const String _onBoarding = 'onboarding';
  static const String _signIn = 'signIn';
  static const String _signUp = 'signUp';
  static const String _payment = 'payment';

  static const List<String> shellTabs = [
    "home",
    "appointments",
    "history",
    "account",
  ];

  // routes
  static String onBoarding() => '/$_onBoarding';
  static String signIn() => '/$_signIn';
  static String signUp() => '/$_signUp';
  static String home() => '/';
  static String payment() => '/$_payment';

  // shell
  static String daily() => '/?tab=${shellTabs[0]}';
  static String appointments() => '/?tab=${shellTabs[1]}';
  static String history() => '/?tab=${shellTabs[2]}';
  static String account() => '/?tab=${shellTabs[3]}';

  static BeamerDelegate buildRouterDelegate() {
    final String initialRoute = AppRouter.home();
    final routerDelegate = BeamerDelegate(
      initialPath: initialRoute,
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/': (_, state, ___) => BeamPage(
            key: const ValueKey(_shell),
            child: ShellScreen(routerState: state),
          ),
          '/$_onBoarding': (_, __, ___) => const OnboardingScreen(),
          '/$_signIn': (_, __, ___) => const SignInScreen(),
          '/$_signUp': (_, __, ___) => const SignUpScreen(),
          '/$_payment': (_, __, ___) => const PaymentScreen(),
        },
      ).call,
    );
    _navigatorKey = routerDelegate.navigatorKey;
    return routerDelegate;
  }
}
