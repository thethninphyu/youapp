import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:youapp/enum/status.dart';
import 'package:youapp/module/profile/profile_module.dart';
import 'package:youapp/profile/bloc/profile_bloc.dart';
import 'package:youapp/profile/response/profile_response.dart';
import 'package:youapp/profile/user_profile_body.dart';
import 'package:youapp/routes/profile/profile_routes.dart';
import 'package:youapp/util/app_color.dart';
import 'package:youapp/util/app_logger.dart';
import 'package:youapp/util/app_router.dart';
import 'package:youapp/util/app_string.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool show = false;
  ProfileResponse? profileResponse;
  File? image;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<ProfileBloc>(context).add(GetUserProfileEvent());
    });

    loadImage();
  }

  void loadImage() async {
    try {
      final Directory appDirectory = await getApplicationDocumentsDirectory();
      final String path = appDirectory.path;

      final List<FileSystemEntity> files = Directory(path).listSync();

      File? latestImageFile;
      int latestTimestamp = 0;

      for (var file in files) {
        if (file is File &&
            (file.path.endsWith('.jpg') || file.path.endsWith('.png'))) {
          logger.d("Found file: ${file.path}");
          final int fileTimestamp =
              await file.lastModified().then((dt) => dt.millisecondsSinceEpoch);
          if (fileTimestamp > latestTimestamp) {
            latestTimestamp = fileTimestamp;
            latestImageFile = file;
          }
        }
      }

      if (latestImageFile != null && latestImageFile.existsSync()) {
        setState(() {
          image = latestImageFile;
          logger.d("Retrieved image: $image");
        });
      } else {
        logger.d("No image found.");
      }
    } catch (e) {
      logger.d("Error retrieving image: $e");
    }
  }

  void _handleUpdateProfile() {
    setState(() {
      show = !show;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem<int>(
                  value: 0,
                  child: Text(AppString.updateProfile),
                ),
              ];
            },
            icon: const FaIcon(
              FontAwesomeIcons.ellipsis,
              color: Colors.white,
            ),
            onSelected: (int value) {
              _handleUpdateProfile();
            },
          ),
        ],
        elevation: 0,
        title: Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/back.png",
                color: Colors.white,
                width: 7,
                height: 16,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                "Back",
                style: TextStyle(
                  color: YouAppColor.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  key: Key('usernameField'),
                  profileResponse?.userData.username ?? '',
                  style: const TextStyle(
                    color: YouAppColor.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
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
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  switch (state.status) {
                    case Status.loading:
                      return const Center(child: CircularProgressIndicator());
                    case Status.failed:
                      return const Center(child: Text('Failed'));
                    case Status.success:
                      profileResponse = state.response;
                      return buildProfileContent();
                    default:
                      return const SizedBox();
                  }
                },
              ),
              const SizedBox(height: 20),
              createProfile(),
              const SizedBox(height: 20),
              buildInterest(
                AppString.interest,
                AppString.profileInterestDescription,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProfileContent() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: YouAppColor.cardBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        image: image == null
            ? null
            : DecorationImage(
                image: FileImage(File(image!.path)),
                fit: BoxFit.contain,
              ),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 16,
            bottom: 45,
            child: Text(
              profileResponse?.userData.username ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 20,
            child: Text(
              profileResponse?.userData.email ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createProfile() {
    return !show
        ? buildInfoCard(
            AppString.about,
            AppString.profileAboutDescription,
          )
        : UserProfileBody(
            callBackImage: getImage,
            profileResponse: profileResponse,
          );
  }

  Widget buildInterest(String title, String description) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: YouAppColor.cardBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              IconButton(
                onPressed: () {
                  AppRouter.changeRoute<ProfileModule>(
                    ProfileRoutes.updateInterest,
                    args: profileResponse,
                  );
                },
                icon: const Icon(Icons.edit, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(width: 10),
          Text(
            profileResponse?.userData.interests.join(', ') ?? description,
            style: const TextStyle(color: Colors.grey, fontSize: 14),
          ),
        ],
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              IconButton(
                onPressed: () {
                  setState(() {
                    show = !show;
                  });
                },
                icon: const Icon(Icons.edit, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(width: 10),
          if (profileResponse?.userData.birthday != null &&
              profileResponse?.userData.height != 0 &&
              profileResponse?.userData.weight != 0) ...[
            buildUserData(profileResponse!.userData),
          ] else
            Text(
              description,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
        ],
      ),
    );
  }

  Widget buildUserData(UserData userData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildInfoRow('Birthday', userData.birthday),
        buildInfoRow('Horoscope', userData.horoscope),
        buildInfoRow('Height', '${userData.height} cm'),
        buildInfoRow('Weight', '${userData.weight} kg'),
      ],
    );
  }

  Widget buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  void getImage(File? selectedImage) {
    setState(() {
      logger.e("Image $selectedImage");
      image = selectedImage;
    });
  }
}
