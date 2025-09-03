import 'package:flutter/material.dart';
import 'package:smart_med/app.dart';
import 'package:smart_med/infra/initializations/initializer.dart';
import 'package:smart_med/infra/initializations/registers/providers_initializer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Initializer.initializeConfigurations();
  final providers = await ProvidersInitializer.initialize();
  runApp(App(providers: providers));
}
