import 'package:smart_med/domain/entities/user_model.dart';

class UserState {
  final UserModel? user;
  final bool isLoading;

  const UserState({this.user, this.isLoading = false});

  UserState copyWith({UserModel? user, bool? isLoading}) {
    return UserState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
