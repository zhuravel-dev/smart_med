import 'package:get_it/get_it.dart';
import 'package:smart_med/domain/entities/user.dart';
import 'package:smart_med/domain/irepositories/iuser_repository.dart';
import 'package:smart_med/presentation/cubits/user/user_state.dart';
import 'package:bloc/bloc.dart';

class UserCubit extends Cubit<UserState> {
  final _userRepository = GetIt.I<IUserRepository>();

  UserCubit() : super(const UserState(isLoading: true));

  Future<void> loadUser() async {
    emit(state.copyWith(isLoading: true));
    final user = await _userRepository.getUser();
    emit(UserState(user: user, isLoading: false));
  }

  Future<void> updateUser(User user) async {
    await _userRepository.updateUser(user);
    await loadUser();
  }
}
