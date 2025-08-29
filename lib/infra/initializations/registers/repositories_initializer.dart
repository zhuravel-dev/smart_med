import 'package:get_it/get_it.dart';
import 'package:smart_med/domain/irepositories/iuser_repository.dart';
import 'package:smart_med/infra/data/user_repository.dart';

abstract class ProvidersInitializer {
  static void initialize() {
    GetIt.I.registerSingleton<IUserRepository>(UserRepositoryImpl());
  }
}
