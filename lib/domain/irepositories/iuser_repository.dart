import 'package:smart_med/domain/entities/user.dart';

abstract class IUserRepository {
  Future<User> getUser();
  Future<void> updateUser(User user);
  Future<void> deleteUser();
}
