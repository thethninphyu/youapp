import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:youapp/util/app_color.dart';
import 'package:youapp/util/custom_app_bar.dart';
import 'package:youapp/widgets/background.dart';

class UpdateInterestWidget extends StatelessWidget {
  const UpdateInterestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: '',
        onPressed: () {},
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Save',
                style: TextStyle(color: YouAppColor.goldColor),
              ))
        ],
      ),
      body: GradientBackground(
          child: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 195,
            ),
            const Text(
              'Tell everyone about yourself',
              style: TextStyle(color: YouAppColor.goldColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'What interest you?',
              style: TextStyle(
                  color: YouAppColor.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
