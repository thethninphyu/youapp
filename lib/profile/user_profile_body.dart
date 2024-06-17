import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youapp/enum/status.dart';
import 'package:youapp/profile/bloc/profile_bloc.dart';
import 'package:youapp/profile/request/profile_request.dart';
import 'package:youapp/profile/response/profile_response.dart';
import 'package:youapp/util/app_date_field.dart';
import 'package:youapp/util/app_drop_down_field.dart';
import 'package:youapp/util/app_color.dart';
import 'package:youapp/util/app_logger.dart';
import 'package:youapp/util/app_sign.dart';
import 'package:youapp/util/app_textfield.dart';

class UserProfileBody extends StatefulWidget {
  final Function(File? image) callBackImage;
  const UserProfileBody({super.key, required this.callBackImage});

  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  ProfileResponse? profileResponse;
  String displayName = "";
  String birthday = "";
  String horoscope = "";
  String zodiac = "";
  int height = 0;
  int weight = 0;
  String gender = "";

  File? _image;

  final ImagePicker _picker = ImagePicker();

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

  getHeightFromCallBack(String text) {
    setState(() {
      height = int.parse(text);
      if (height != 0) {
        "${height}cm";
      }
    });
  }

  void getWeightFromCallBack(String text) {
    setState(() {
      weight = int.parse(text);
    });
  }

  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        logger.e("Image$_image");
        widget.callBackImage(_image);
      });
    }
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
                      logger.e("BeforeSave1$displayName");
                      logger.e("BeforeSave2$birthday");
                      logger.e("BeforeSave3$height");
                      logger.e("BeforeSave4$weight");
                      if (displayName.isEmpty &&
                          birthday.isEmpty &&
                          height != 0 &&
                          weight != 0) {
                        EasyLoading.showInfo("You have to fill data!");
                      } else {
                        context.read<ProfileBloc>().add(ProfileCreateEvent(
                            profileRequest: ProfileRequest(
                                name: displayName,
                                birthday: birthday,
                                height: height,
                                weight: weight,
                                interests: [])));
                      }
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
                  InkWell(
                    onTap: pickImage,
                    child: Container(
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
                callBackController: getWeightFromCallBack,
                label: 'Weight:',
                hint: 'Add weight',
              ),
            ],
          ),
        );
      },
    );
  }
}
