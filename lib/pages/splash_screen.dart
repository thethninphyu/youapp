import 'package:flutter/material.dart';
import 'package:youapp/auth/register/register.dart';
import 'package:youapp/util/app_color.dart';
import 'package:youapp/util/app_logger.dart';

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
    logger.e("i enter here");
    getDataFromSharedPreference();
    super.initState();
  }

  getDataFromSharedPreference() async {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const RegisterWidget()));
    // if (userId != null) {
    //   // AppRouter.changeRoute<HomeModule>(HomeRoutes.root, isReplaceAll: true);
    // } else {
    //   // AppRouter.changeRoute<HomeModule>(HomeRoutes.root, isReplaceAll: true);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: YouAppColor.mainColor,
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Image.asset('assets/images/insight.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
