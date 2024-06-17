import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:youapp/enum/status.dart';
import 'package:youapp/module/profile/profile_module.dart';
import 'package:youapp/profile/repository/profile_repository.dart';
import 'package:youapp/profile/request/profile_request.dart';
import 'package:youapp/profile/response/profile_response.dart';
import 'package:youapp/routes/profile/profile_routes.dart';
import 'package:youapp/util/app_logger.dart';
import 'package:youapp/util/app_router.dart';

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

        AppRouter.changeRoute<ProfileModule>(ProfileRoutes.profile,
            isReplace: false);
      } catch (e) {
        logger.e("Create Profile error is $e");
        emit(state.copyWith(status: Status.failed));
      }
    });

    on<GetUserProfileEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.loading));
        final response = await repository.getProfile();

        final profileResponse = ProfileResponse.fromJson(response);

        EasyLoading.showSuccess(profileResponse.message);
        emit(state.copyWith(status: Status.success, response: profileResponse));
      } catch (e) {
        emit(state.copyWith(status: Status.failed));
      }
    });

    on<UpdateProfileEvent>((event, emit) async {
      try {
        emit(state.copyWith(status: Status.initial));
        final response =
            await repository.updateProfile(event.updateProfileRequest.toJson());

        final updateProfileResponse = ProfileResponse.fromJson(response);
        EasyLoading.showSuccess(updateProfileResponse.message);

        emit(state.copyWith(
            status: Status.success, response: updateProfileResponse));
      } catch (e) {
        emit(state.copyWith(status: Status.failed));
      }
    });
  }
}
