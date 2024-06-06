import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:youapp/util/app_color.dart';
import 'package:youapp/util/custom_app_bar.dart';
import 'package:youapp/widgets/background.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: '@Johndoe123',
        onPressed: () {},
      ),
      body: GradientBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: 359,
                  height: 190,
                  child: Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/xiao_bg.png'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      const Positioned(
                        top: 80.0,
                        left: 10.0,
                        child: Text(
                          '@John Doe, 29',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 100.0,
                        left: 10.0,
                        child: Text(
                          'Male',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 10.0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          width: 97,
                          height: 36,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(100, 22, 44, 33),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                FontAwesomeIcons.piggyBank,
                                size: 16,
                                color: YouAppColor.whiteColor,
                              ),
                              Text(
                                'Virgo',
                                style: TextStyle(
                                  color: YouAppColor.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 150.0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          width: 97,
                          height: 36,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(100, 22, 44, 33),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                FontAwesomeIcons.piggyBank,
                                size: 16,
                                color: YouAppColor.whiteColor,
                              ),
                              Text(
                                'Pig',
                                style: TextStyle(
                                  color: YouAppColor.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: YouAppColor.cardColor,
                ),
                height: 219,
                width: 359,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'About',
                          style: TextStyle(
                            color: YouAppColor.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: YouAppColor.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    RichText(
                      text: const TextSpan(
                        text: 'Birthday : ',
                        style: TextStyle(
                          color: YouAppColor.grey,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: ' 28 / 08 / 1997 (Age 28)',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: YouAppColor.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    RichText(
                      text: const TextSpan(
                        text: 'Horoscope : ',
                        style: TextStyle(
                          color: YouAppColor.grey,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: ' Virgo',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: YouAppColor.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    RichText(
                      text: const TextSpan(
                        text: 'Zodiac : ',
                        style: TextStyle(
                          color: YouAppColor.grey,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: ' Pig',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: YouAppColor.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    RichText(
                      text: const TextSpan(
                        text: 'Height : ',
                        style: TextStyle(
                          color: YouAppColor.grey,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: ' 175 cm',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: YouAppColor.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    RichText(
                      text: const TextSpan(
                        text: 'Weight : ',
                        style: TextStyle(
                          color: YouAppColor.grey,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: ' 69 kg',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: YouAppColor.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 22.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: YouAppColor.cardColor,
                ),
                height: 109,
                width: 359,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Interest',
                          style: TextStyle(
                              color: YouAppColor.whiteColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.edit,
                            color: YouAppColor.whiteColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Add in your interest to find a better match.',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
