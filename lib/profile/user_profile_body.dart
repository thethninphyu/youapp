import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/enum/status.dart';
import 'package:youapp/module/profile/profile_module.dart';
import 'package:youapp/profile/bloc/profile_bloc.dart';
import 'package:youapp/profile/request/profile_request.dart';
import 'package:youapp/profile/response/profile_response.dart';
import 'package:youapp/routes/profile/profile_routes.dart';
import 'package:youapp/util/app_date_field.dart';
import 'package:youapp/util/app_drop_down_field.dart';
import 'package:youapp/util/app_color.dart';
import 'package:youapp/util/app_logger.dart';
import 'package:youapp/util/app_router.dart';
import 'package:youapp/util/app_sign.dart';
import 'package:youapp/util/app_textfield.dart';

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({super.key});

  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  ProfileResponse? profileResponse;
  String displayName = "";
  String birthday = "";
  String horoscope = "";
  String zodiac = "";
  String height = "";
  String weight = "";
  String gender = "";

  void getDisplayNameFromCallBack(String text) {
    setState(() {
      displayName = text;
    });
  }

  void getBirthdayFromCallBack(String text) {
    setState(() {
      birthday = text;
    });
  }

  void getHoroscopeSign(String text) {
    setState(() {
      horoscope = text;
    });
  }

  void getZodiacSign(String text) {
    setState(() {
      zodiac = text;
    });
  }

  void getHeightFromCallBack(String text) {
    setState(() {
      height = text;
      if (height.isNotEmpty) {
        "${height}cm";
      }
    });
  }

  void getWeightFromCallBack(String text) {
    setState(() {
      weight = text;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        switch (state.status) {
          case Status.loading:
            const Center(
              child: CircularProgressIndicator(),
            );
            break;
          case Status.success:
            profileResponse = state.response;
            if (profileResponse != null) {
              AppRouter.changeRoute<ProfileModule>(ProfileRoutes.about);
            }
            break;
          case Status.failed:
            const Center(
              child: Text('Failed'),
            );
          default:
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(color: YouAppColor.whiteColor),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<ProfileBloc>().add(ProfileCreateEvent(
                          profileRequest: ProfileRequest(
                              name: displayName,
                              birthday: "20-05-1997",
                              height: height,
                              weight: weight,
                              interests: [])));
                    },
                    child: const Text(
                      'Save & Update',
                      style: TextStyle(
                          color: YouAppColor.goldenColor, fontSize: 16),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 40,
                      color: YouAppColor.goldColor,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'Add image',
                    style:
                        TextStyle(fontSize: 18, color: YouAppColor.whiteColor),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AppTextField(
                label: 'Display name:',
                hint: 'Enter name',
                callBackController: getDisplayNameFromCallBack,
              ),
              AppDropDownFiled(
                label: 'Gender:',
                hint: 'Select Gender',
                context: context,
                returnChangeValue: (changeValue) {
                  logger.e(changeValue);
                  setState(() {
                    gender = changeValue;
                  });
                },
              ),
              AppDateTextField(
                label: 'Birthday:',
                hint: 'DD MM YYYY',
                callBackController: getBirthdayFromCallBack,
                horoscopeSign: getHoroscopeSign,
                zodiacSign: getZodiacSign,
              ),
              AppSign(label: "Horoscope", text: horoscope),
              AppSign(label: "Zodiac", text: zodiac),
              AppTextField(
                label: 'Height:',
                hint: 'Add height',
                callBackController: getHeightFromCallBack,
              ),
              AppTextField(
                label: 'Weight:',
                hint: 'Add weight',
                callBackController: getWeightFromCallBack,
              ),
            ],
          ),
        );
      },
    );
  }
}