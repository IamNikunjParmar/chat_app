import 'package:chat_app/src/package/utils/image_utils.dart';
import 'package:chat_app/src/ui/create%20signUp/create_screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';

import '../../components/button/button.dart';
import '../../components/input field/input_field.darty.dart';
import '../../logic/login/login_page_cubit.dart';
import '../../package/helper/validate.dart';
import '../../package/resocues/color.dart';

class LoginScreenView extends StatelessWidget {
  LoginScreenView({super.key});

  static const String routeName = 'login_page_view';
  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginPageCubit(
        context: context,
        const LoginPageState(),
      ),
      child: LoginScreenView(),
    );
  }

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final log = Logger();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return BlocBuilder<LoginPageCubit, LoginPageState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Form(
                      key: globalKey,
                      child: Column(
                        children: [
                          const Gap(20),
                          const Center(
                            child: Text(
                              "Login here",
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryGreen,
                              ),
                            ),
                          ),
                          const Gap(20),
                          Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Welcome back you’ve \n  been missed!",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                          const Gap(70),
                          EmailTextFormField(
                            controller: emailController,
                            hintText: 'Enter Your Email',
                            autofocus: false,
                            validator: validateEmail,
                            textInputAction: TextInputAction.next,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                          const Gap(30),
                          PasswordTextField(
                            controller: passwordController,
                            hintText: 'Enter Your Password',
                            validator: validatePassword,
                            textInputAction: TextInputAction.next,
                          ),
                          const Gap(30),
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              textAlign: TextAlign.center,
                              "Forgot your password?",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primaryGreen,
                              ),
                            ),
                          ),
                          const Gap(30),
                          GestureDetector(
                            onTap: () {
                              if (globalKey.currentState!.validate()) {
                                context.read<LoginPageCubit>().loginWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                              }
                            },
                            child: CustomButton(
                              screenHeight: screenHeight,
                              onPressed: () {},
                              child: const Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Create new Account?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, CreateScreenView.routeName);
                                },
                                child: const Text(
                                  textAlign: TextAlign.center,
                                  " Sign Up",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.primaryGreen,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(110),
                          const Text(
                            textAlign: TextAlign.center,
                            "Or continue With",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: AppColor.primaryGreen,
                            ),
                          ),
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.read<LoginPageCubit>().loginWithGoogle();
                                },
                                child: Container(
                                  height: screenHeight * 0.06,
                                  width: screenWidth * 0.2,
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryGreen,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: theme.brightness == Brightness.light
                                            ? Colors.grey
                                            : Colors.black.withOpacity(0.5),
                                        offset: const Offset(3, 3),
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: Transform.scale(
                                    scale: 0.69,
                                    child: Image.asset(
                                      ImagePath.google,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: screenHeight * 0.06,
                                width: screenWidth * 0.2,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryGreen,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: theme.brightness == Brightness.light
                                          ? Colors.grey
                                          : Colors.black.withOpacity(0.5),
                                      offset: const Offset(3, 3),
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Transform.scale(
                                  scale: 0.69,
                                  child: Image.asset(ImagePath.facebook),
                                ),
                              ),
                              Container(
                                height: screenHeight * 0.06,
                                width: screenWidth * 0.2,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryGreen,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: theme.brightness == Brightness.light
                                          ? Colors.grey
                                          : Colors.black.withOpacity(0.5),
                                      offset: const Offset(3, 3),
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Transform.scale(
                                  scale: 0.69,
                                  child: Image.asset(
                                    ImagePath.apple,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (state.isLoading)
              Container(
                color: Colors.black.withOpacity(0.6),
                child: Center(
                  child: LoadingAnimationWidget.fourRotatingDots(
                    color: theme.brightness == Brightness.light ? AppColor.primaryGreen : Colors.white,
                    size: 40,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
