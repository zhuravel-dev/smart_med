import 'dart:async';
import 'package:smart_med/domain/entities/user.dart';
import 'package:smart_med/domain/iservices/iuser_api.dart';
import 'package:smart_med/infra/helpers/result.dart';
import 'package:smart_med/infra/helpers/failures.dart';

class UserApi implements IUserApi {
  User _currentUser = User(
    id: 1,
    firstName: 'John',
    lastName: 'Doe',
    email: 'john.doe@example.com',
  );

  bool throwException = false;
  bool throwFailure = false;

  @override
  Future<Result<User>> getCurrentUser() async {
    if (throwException) return Result.error(Exception('Simulated exception'));
    if (throwFailure) return Result.failure(Failure.serverFailure());

    return Result.correct(_currentUser);
  }

  @override
  Future<Result<User>> getUserById(int userId) async {
    if (throwException) return Result.error(Exception('Simulated exception'));
    if (throwFailure) return Result.failure(Failure.serverFailure());

    if (_currentUser.id == userId) {
      return Result.correct(_currentUser);
    } else {
      return Result.error(Exception('User not found'));
    }
  }

  @override
  Future<Result<void>> updateUser(User user) async {
    if (throwException) return Result.error(Exception('Simulated exception'));
    if (throwFailure) return Result.failure(Failure.serverFailure());

    if (_currentUser.id == user.id) {
      _currentUser = _currentUser.copyWith(
        firstName: user.firstName,
        lastName: user.lastName,
        email: user.email,
      );
      return Result.empty();
    } else {
      return Result.error(Exception('User not found'));
    }
  }

  @override
  Future<Result<void>> deleteUser(int userId) async {
    if (throwException) return Result.error(Exception('Simulated exception'));
    if (throwFailure) return Result.failure(Failure.serverFailure());

    if (_currentUser.id == userId) {
      _currentUser = User(id: 1, firstName: '', lastName: '', email: '');
      return Result.empty();
    } else {
      return Result.error(Exception('User not found'));
    }
  }
}
