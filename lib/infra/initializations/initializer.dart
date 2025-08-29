import 'package:smart_med/infra/initializations/registers/api_initializer.dart';

abstract class Initializer {
  static Future<void> initializeConfigurations() async {
    ApiInitializer.initialize();
  }
}
