import 'package:get_it/get_it.dart';
import 'package:smart_med/domain/irepositories/icategory_repository.dart';
import 'package:smart_med/domain/irepositories/iuser_repository.dart';
import 'package:smart_med/infra/data/repositories/category_repository_impl.dart';
import 'package:smart_med/infra/data/repositories/user_repository_impl.dart';

abstract final class RepositoriesInitializer {
  static void initialize() {
    final getIt = GetIt.I;
    getIt.registerLazySingleton<IUserRepository>(() => UserRepository());
    getIt.registerLazySingleton<ICategoryRepository>(() => CategoryRepository());
  }
}
