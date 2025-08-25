import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/presentation/navigation/shell_screen.dart';

class AppRouter {
  static const List<String> shellTabs = [
    "home",
    "appointments",
    "history",
    "articles",
    "profile",
  ];

  static String home() => '/?tab=${shellTabs[0]}';
  static String appointments() => '/?tab=${shellTabs[1]}';
  static String history() => '/?tab=${shellTabs[2]}';
  static String articles() => '/?tab=${shellTabs[3]}';
  static String profile() => '/?tab=${shellTabs[4]}';

  static BeamerDelegate buildRouterDelegate({String initialTab = 'home'}) {
    return BeamerDelegate(
      initialPath: '/?tab=$initialTab',
      locationBuilder: RoutesLocationBuilder(
        routes: {
          '/': (context, state, __) {
            print("Route: ${state.uri}, Query: ${state.queryParameters}");
            return BeamPage(
              key: const ValueKey('shell'),
              child: ShellScreen(routerState: state),
            );
          },
        },
      ).call,
      notFoundPage: const BeamPage(
        key: ValueKey('not-found'),
        child: Scaffold(
          body: Center(child: Text("Not found")),
        )
      ),
    );
  }
}