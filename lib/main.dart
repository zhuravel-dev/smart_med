import 'package:flutter/material.dart';
import 'package:beamer/beamer.dart';
import 'package:smart_med/presentation/navigation/app_router.dart';

import 'infra/initializations/initializer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Initializer.initializeConfigurations();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   late final routerDelegate = AppRouter.buildRouterDelegate();

    return MaterialApp.router(
      title: 'SmartMed',
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: routerDelegate),
    );
  }
}
