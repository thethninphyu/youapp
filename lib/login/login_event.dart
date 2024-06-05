part of 'login_bloc.dart';

@immutable
class LoginEvent {}

class LoginRequestEvent extends LoginEvent {
  final LoginRequestModel loginRequestModel;
  LoginRequestEvent({required this.loginRequestModel});
}
