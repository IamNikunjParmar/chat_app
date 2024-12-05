import 'package:chat_app/src/ui/home/home_page_view.dart';
import 'package:chat_app/src/ui/login/login_screen_view.dart';
import 'package:chat_app/src/ui/otp/otp_screen_view.dart';
import 'package:chat_app/src/ui/profile/profile_page_view.dart';
import 'package:chat_app/src/ui/splash/boarding_screen_view.dart';
import 'package:chat_app/src/ui/splash/splash_screen_view.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get myRoutes => <String, WidgetBuilder>{
        HomePageView.routeName: HomePageView.builder,
        SplashScreenView.routeName: SplashScreenView.builder,
        OnBoardingView.routeName: OnBoardingView.builder,
        LoginScreenView.routeName: LoginScreenView.builder,
        OtpScreenView.routeName: OtpScreenView.builder,
        ProfilePageView.routeName: ProfilePageView.builder,
      };
}
