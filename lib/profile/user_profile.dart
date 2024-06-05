import 'package:flutter/material.dart';
import 'package:youapp/module/profile/profile_module.dart';
import 'package:youapp/profile/user_profile_body.dart';
import 'package:youapp/routes/profile/profile_routes.dart';
import 'package:youapp/util/app_color.dart';
import 'package:youapp/util/app_router.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: YouAppColor.profileBackgroundColor,
        appBar: AppBar(
          backgroundColor: YouAppColor.profileBackgroundColor,
          title: const Text(
            'About',
            style: TextStyle(color: YouAppColor.whiteColor),
          ),
          actions: [
            TextButton(
              onPressed: () {
                AppRouter.changeRoute<ProfileModule>(ProfileRoutes.about);
              },
              child: const Text(
                'Save & Update',
                style: TextStyle(color: YouAppColor.goldenColor, fontSize: 16),
              ),
            ),
          ],
        ),
        body: const UserProfileBody());
  }
}
