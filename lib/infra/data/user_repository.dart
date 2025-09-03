import 'package:smart_med/domain/entities/user.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_med/domain/irepositories/iuser_repository.dart';
import 'package:smart_med/domain/iservices/iuser_api.dart';

class UserRepository implements IUserRepository {
  final _userApi = GetIt.I<IUserApi>();

  @override
  Future<User> getUser() async {
    final result = await _userApi.getCurrentUser();
    if (result.hasData && result.data != null) {
      return result.data!;
    } else {
      throw result.exception ??
          Exception('Error in UserRepositoryImpl getUser()');
    }
  }

  @override
  Future<void> updateUser(User user) async {
    final result = await _userApi.updateUser(user);
    if (result.hasError) {
      throw result.exception!;
    }
  }

  @override
  Future<void> deleteUser() async {
    final user = await getUser();
    final result = await _userApi.deleteUser(user.id);
    if (result.hasError) {
      throw result.exception!;
    }
  }
}
