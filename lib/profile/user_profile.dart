import 'package:flutter/material.dart';
import 'package:youapp/module/profile/profile_module.dart';
import 'package:youapp/profile/user_profile_body.dart';
import 'package:youapp/routes/profile/profile_routes.dart';
import 'package:youapp/util/app_color.dart';
import 'package:youapp/util/app_router.dart';
import 'package:youapp/util/app_string.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Row(
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/back.png",
                      color: Colors.white,
                      width: 7,
                      height: 16,
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Back",
                    style: TextStyle(
                        color: YouAppColor.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
            const Expanded(
              child: Center(
                child: Text(
                  '@johndoe123',
                  style: TextStyle(
                      color: YouAppColor.whiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Header
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: YouAppColor.cardBackgroundColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Stack(
                  children: [
                    Positioned(
                      left: 16,
                      bottom: 16,
                      child: Text(
                        '@johndoe123,',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // About Section
              !show
                  ? buildInfoCard(
                      AppString.about, AppString.profileAboutDescription)
                  : const UserProfileBody(),
              const SizedBox(height: 20),
              // Interests Section
              buildInfoCard(AppString.interest, AppString.interest),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoCard(String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: YouAppColor.cardBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              if (title == "Interest") {
                AppRouter.changeRoute<ProfileModule>(ProfileRoutes.interest);
              } else {
                setState(() {
                  show = !show;
                });
              }
            },
            icon: const Icon(Icons.edit, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}

Widget buildTextField(String label, String placeholder) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
        const SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: const TextStyle(color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[800],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}
