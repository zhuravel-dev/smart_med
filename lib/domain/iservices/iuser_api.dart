import 'package:smart_med/domain/entities/user.dart';
import 'package:smart_med/infra/helpers/result.dart';

abstract class IUserApi {
  Future<Result<User>> getCurrentUser();
  Future<Result<User>> getUserById(int userId);
  Future<Result<void>> updateUser(User user);
  Future<Result<void>> deleteUser(int userId);
}
