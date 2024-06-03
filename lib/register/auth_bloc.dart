import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:youapp/auth_repository/auth_repo.dart';
import 'package:youapp/enum/status.dart';
import 'package:youapp/model/authrequest_model.dart';
import 'package:youapp/response/authresponse.dart';
import 'package:youapp/util/app_logger.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository = AuthRepository();

  AuthBloc() : super(const AuthState(addStatus: Status.initial)) {
    on<AuthEvent>((event, emit) {});

    on<RegisterEvent>((event, emit) async {
      try {
        emit(state.copyWith(addStatus: Status.loading));
        final response = await repository.registerApi(event.authRequestModel);

        logger.e("rp is $response");

        final authResponse = AuthResponse.fromJosn(response);
        logger.e("Register rp is $response");

        emit(state.copyWith(addStatus: Status.initial, response: authResponse));
        EasyLoading.showSuccess(authResponse.status);
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
