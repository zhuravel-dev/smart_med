import 'package:smart_med/infra/initializations/registers/api_initializer.dart';
import 'package:smart_med/infra/initializations/registers/repositories_initializer.dart';

abstract final class Initializer {
  static Future<void> initializeConfigurations() async {
    ApiInitializer.initialize();
    RepositoriesInitializer.initialize();
  }
}
