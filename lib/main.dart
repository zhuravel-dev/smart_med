import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:smart_med/presentation/navigation/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerDelegate = AppRouter.buildRouterDelegate(initialTab: 'home');

    return MaterialApp.router(
      title: 'SmartMed',
      debugShowCheckedModeBanner: false,
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      routeInformationProvider: PlatformRouteInformationProvider(
        initialRouteInformation: RouteInformation(location: AppRouter.home()),
      ),
      backButtonDispatcher: BeamerBackButtonDispatcher(delegate: routerDelegate),
      builder: (context, child) {
        Future.microtask(() {
          print("MaterialApp: ${Beamer.of(context).currentBeamLocation.state.routeInformation.location}");
        });
        return child ?? const SizedBox.shrink();
      },
    );
  }
}