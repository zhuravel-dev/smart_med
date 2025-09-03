import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:smart_med/presentation/cubits/user/user_cubit.dart';

abstract class ProvidersInitializer {
  static Future<List<BlocProvider>> initialize() async {
    final userCubit = UserCubit();
    GetIt.I.registerSingleton<UserCubit>(userCubit);

    return [
      BlocProvider<UserCubit>(create: (BuildContext context) => UserCubit()),
    ];
  }
}
