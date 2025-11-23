import 'package:smart_med/domain/entities/user_model.dart';
import 'package:smart_med/infra/helpers/result.dart';

abstract class IUserApi {
  Future<Result<UserModel>> getCurrentUser();
  Future<Result<UserModel>> getUserById(int userId);
  Future<Result<void>> updateUser(UserModel user);
  Future<Result<void>> deleteUser(int userId);
}
