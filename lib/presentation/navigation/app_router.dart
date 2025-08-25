import 'package:beamer/beamer.dart';

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

  static BeamerDelegate buildRouterDelegate() {
   // TODO BeamerDelegate
  }
}
