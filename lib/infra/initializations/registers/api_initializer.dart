import 'package:get_it/get_it.dart';
import 'package:smart_med/domain/iservices/iuser_api.dart';
import 'package:smart_med/infra/services/user_api.dart';

abstract class ApiInitializer {
  static void initialize() {
    GetIt.I.registerSingleton<IUserApi>(UserApi());
  }
}
