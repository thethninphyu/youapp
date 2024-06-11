import 'package:flutter/material.dart';
import 'package:youapp/module/auth/auth_module.dart';
import 'package:youapp/routes/auth/auth_routes.dart';
import 'package:youapp/util/app_color.dart';

import 'package:youapp/util/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //final AppSharePreference user = AppSharePreference();
  String? userId;

  @override
  void initState() {
    getDataFromSharedPreference();
    super.initState();
  }

  getDataFromSharedPreference() async {
    AppRouter.changeRoute<AuthModule>(AuthRoutes.login, isReplaceAll: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YouAppColor.mainColor,
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Image.asset('assets/images/insight.png'),
          ),
        ),
      ),
    );
  }
}
