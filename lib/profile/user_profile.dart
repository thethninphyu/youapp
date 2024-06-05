import 'package:flutter/material.dart';
import 'package:youapp/profile/user_profile_body.dart';
import 'package:youapp/util/app_color.dart';

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
                // Handle save & update action
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
