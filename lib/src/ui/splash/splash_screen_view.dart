import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/src/package/resocues/color.dart';
import 'package:chat_app/src/package/utils/image_utils.dart';
import 'package:chat_app/src/ui/splash/boarding_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  static const String routeName = 'splash_page_view';

  static Widget builder(BuildContext context) {
    return const SplashScreenView();
  }

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3600),
    );

    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastEaseInToSlowEaseOut,
    );

    _animationController.forward();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ScaleTransition(
                scale: _animation,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  constraints: BoxConstraints(maxHeight: screenHeight * 0.138),
                  height: screenHeight * 0.2,
                  width: screenWidth * 0.5,
                  decoration: const BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage(
                        ImagePath.logo,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedTextKit(
              // Use AnimatedTextKit
              animatedTexts: [
                ColorizeAnimatedText(
                  colors: [
                    AppColor.primaryGreen,
                    Colors.lightGreenAccent,
                  ],
                  'Chatter Box',
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: AppColor.primaryGreen,
                  ),
                  speed: const Duration(milliseconds: 100),
                ),
              ],
              totalRepeatCount: 1,
              isRepeatingAnimation: false,
            ),
          ],
        ),
      ),
    );
  }
}
