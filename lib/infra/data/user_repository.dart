import 'package:smart_med/domain/entities/user.dart';
import 'package:smart_med/domain/irepositories/iuser_repository.dart';

class UserRepositoryImpl implements IUserRepository {
  //final UserRemoteDataSource remoteDataSource; // TODO implement Api

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User?> getUser() => remoteDataSource.fetchUser();

  @override
  Future<void> updateUser(User user) => remoteDataSource.updateUser(user);

  @override
  Future<void> deleteUser() => remoteDataSource.deleteUser();
}
