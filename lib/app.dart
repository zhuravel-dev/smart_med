import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_med/presentation/config/theme/smart_med_theme.dart';
import 'package:smart_med/presentation/navigation/app_router.dart';

class App extends StatefulWidget {
  final List<BlocProvider> providers;

  const App({super.key, required this.providers});

  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  late final routerDelegate = AppRouter.buildRouterDelegate();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      key: UniqueKey(),
      providers: widget.providers,
      child: MaterialApp.router(
        title: 'SmartMed',
        routerDelegate: routerDelegate,
        routeInformationParser: BeamerParser(),
        backButtonDispatcher: BeamerBackButtonDispatcher(delegate: routerDelegate),
        debugShowCheckedModeBanner: false,
        theme: SmartMedTheme.light.copyWith(
          textTheme: GoogleFonts.montserratTextTheme(SmartMedTheme.light.textTheme),
        ),
        builder: (context, child) {
          return ScrollConfiguration(behavior: _RemoveGlowEffectBehavior(), child: child!);
        },
      ),
    );
  }
}

class _RemoveGlowEffectBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
