import 'package:chat_app/src/components/Rich%20Text/custom_rich_text.dart';
import 'package:chat_app/src/logic/splash/onboarding_page_cubit.dart';
import 'package:chat_app/src/package/resocues/color.dart';
import 'package:chat_app/src/package/utils/image_utils.dart';
import 'package:chat_app/src/ui/home/home_page_view.dart';
import 'package:chat_app/src/ui/login/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static const String routeName = 'boarding_page_view';

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingPageCubit(),
      child: const OnBoardingView(),
    );
  }

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);

    return BlocBuilder<OnboardingPageCubit, OnboardingPageState>(
      builder: (context, state) {
        final onBoardingCubit = context.read<OnboardingPageCubit>();
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (val) {
                    onBoardingCubit.pageChange(val);
                  },
                  children: [
                    richTextPage(
                      screenHeight,
                      screenWidth,
                      ImagePath.onBoardingScreen1,
                      'Connect easily with\nyour family and friends\nover countries',
                      context,
                    ),
                    richTextPage(
                      screenHeight,
                      screenWidth,
                      ImagePath.onBoardingScreen2,
                      'Enjoy secure and private \n conversations\nwith your loved ones',
                      context,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: 2,
                      effect: const WormEffect(
                        activeDotColor: AppColor.primaryGreen,
                        dotColor: Colors.grey,
                        dotHeight: 10,
                        dotWidth: 10,
                      ),
                    ),
                    const Gap(20),
                    InkWell(
                      onTap: () {
                        if (state.currentIndex == 0) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          ); // Navigate to next page
                        } else {
                          Navigator.pushReplacementNamed(context, LoginScreenView.routeName);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: screenHeight * 0.065,
                        decoration: BoxDecoration(
                          color: AppColor.primaryGreen,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: theme.brightness == Brightness.light ? Colors.grey : Colors.black.withOpacity(0.1),
                              offset: const Offset(3, 3),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Text(
                          state.currentIndex == 0 ? 'Next' : 'Start Messaging',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
