import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:youapp/auth_repository/auth_repo.dart';
import 'package:youapp/enum/status.dart';

import 'package:youapp/model/loginrequest_model.dart';
import 'package:youapp/response/authresponse.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository repository = AuthRepository();
  LoginBloc() : super(const LoginState(addStatus: Status.initial)) {
    on<LoginEvent>((event, emit) {});

    on<LoginRequestEvent>(((event, emit) async {
      try {
        emit(state.copyWith(addStatus: Status.loading));
        final response = await repository.loginApi(event.loginRequestModel);

        final loginResponse = AuthResponse.fromJson(response);

        emit(
            state.copyWith(addStatus: Status.success, response: loginResponse));
        EasyLoading.showSuccess(loginResponse.message);
      } catch (e) {
        emit(state.copyWith(addStatus: Status.failed));
      }
    }));
  }
}
