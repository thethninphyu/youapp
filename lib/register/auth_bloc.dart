import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:youapp/auth_repository/auth_repo.dart';
import 'package:youapp/enum/status.dart';
import 'package:youapp/model/authrequest_model.dart';
import 'package:youapp/response/authresponse.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository = AuthRepository();

  AuthBloc() : super(const AuthState(addStatus: Status.initial)) {
    on<AuthEvent>((event, emit) {});

    on<RegisterEvent>((event, emit) async {
      // logger.d("Request model is ${event.authRequestModel.toJson().values}");
      try {
        emit(state.copyWith(addStatus: Status.loading));
        final response =
            await repository.registerApi(event.authRequestModel.toJson());

        final authResponse = AuthResponse.fromJson(response);

        emit(state.copyWith(addStatus: Status.success, response: authResponse));
        EasyLoading.showSuccess(authResponse.message);
      } catch (e) {
        emit(state.copyWith(
          addStatus: Status.failed,
        ));

        EasyLoading.showError('Failed');
      } finally {
        EasyLoading.dismiss();
      }
    });
  }
}
