import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:youapp/util/app_color.dart';

class YouApp extends StatelessWidget {
  const YouApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'YouApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.accent),
        primaryColor: YouAppColor.mainColor,
        fontFamily: 'Gilroy',
      ),
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    );
  }
}
