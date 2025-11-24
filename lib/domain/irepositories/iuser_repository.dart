import 'package:smart_med/domain/entities/user_model.dart';

abstract class IUserRepository {
  Future<UserModel> getUser();
  Future<void> updateUser(UserModel user);
  Future<void> deleteUser();
}
