import 'package:flutter/material.dart';
import 'package:youapp/module/profile/profile_module.dart';
import 'package:youapp/routes/profile/profile_routes.dart';
import 'package:youapp/util/app_drop_down_field.dart';
import 'package:youapp/util/app_color.dart';
import 'package:youapp/util/app_router.dart';
import 'package:youapp/util/app_textfield.dart';

class UserProfileBody extends StatefulWidget {
  const UserProfileBody({super.key});

  @override
  State<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends State<UserProfileBody> {
  @override
  Widget build(BuildContext context) {
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
                  AppRouter.changeRoute<ProfileModule>(ProfileRoutes.about);
                },
                child: const Text(
                  'Save & Update',
                  style:
                      TextStyle(color: YouAppColor.goldenColor, fontSize: 16),
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
                style: TextStyle(fontSize: 18, color: YouAppColor.whiteColor),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const AppTextField(label: 'Display name:', hint: 'Enter name'),
          AppDropDownFiled(
            label: 'Gender:',
            hint: 'Select Gender',
            context: context,
          ),
          const AppTextField(label: 'Birthday:', hint: 'DD MM YYYY'),
          const AppTextField(label: 'Horoscope:', hint: '--'),
          const AppTextField(label: 'Zodiac:', hint: '--'),
          const AppTextField(label: 'Height:', hint: 'Add height'),
          const AppTextField(label: 'Weight:', hint: 'Add weight'),
        ],
      ),
    );
  }
}
