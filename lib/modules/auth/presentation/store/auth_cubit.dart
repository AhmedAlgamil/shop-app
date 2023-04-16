import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/user_data_model.dart';
import '../../data/repository/auth_repository.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  static AuthCubit get(BuildContext context) => BlocProvider.of(context);
  final AuthRepository _authRepository = AuthRepository();

  UserDataModel? userDataModel;

  login({required String email, required String password}) async {
    emit(LoginLoadingState());
    _authRepository
        .login(
      email: email,
      password: password,
    ).then((value) {
      userDataModel = value;
      print(userDataModel?.message);
      emit(LoginLoadedState());
    }).catchError((e) {
      emit(LoginFailedState());
      print(e.toString());
    });
  }

  register(UserData data) async {
    emit(RegisterLoadingState());
    _authRepository.register(data).then((value) {
      emit(RegisterLoadedState());
      userDataModel = value;
    }).catchError((e) {
      emit(RegisterFailedState());
      print(e.toString());
    });
  }
}
