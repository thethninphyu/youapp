import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:youapp/enum/status.dart';
import 'package:youapp/profile/repository/ProfileRepository.dart';
import 'package:youapp/profile/request/profile_request.dart';
import 'package:youapp/profile/response/profile_response.dart';
import 'package:youapp/util/app_logger.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repository = ProfileRepository();

  ProfileBloc() : super(const ProfileState(status: Status.initial)) {
    on<ProfileCreateEvent>((event, emit) async {
      try {
        logger.e("Enter Here${event.profileRequest.toJson()}");
        emit(state.copyWith(status: Status.loading));
        final response = await repository.createProfile(event.profileRequest);

        final loginResponse = ProfileResponse.fromJson(response);

        EasyLoading.showSuccess(loginResponse.message);
        emit(state.copyWith(status: Status.success, response: loginResponse));
      } catch (e) {
        emit(state.copyWith(status: Status.failed));
      }
    });
  }
}
