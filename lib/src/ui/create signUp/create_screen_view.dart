import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:chat_app/src/package/resocues/color.dart';
import 'package:chat_app/src/package/utils/logger.dart';
import 'package:chat_app/src/ui/login/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../components/button/button.dart';
import '../../components/input field/input_field.darty.dart';
import '../../components/snackBar/snack_bar.dart';
import '../../logic/create signUp/create_page_cubit.dart';
import '../../package/helper/validate.dart';
import '../../package/utils/image_utils.dart';

class CreateScreenView extends StatelessWidget {
  CreateScreenView({super.key});

  static const String routeName = 'create_page_view';
  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => CreatePageCubit(
        context: context,
        const CreatePageState(),
      ),
      child: CreateScreenView(),
    );
  }

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return BlocBuilder<CreatePageCubit, CreatePageState>(
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              resizeToAvoidBottomInset: false,
              body: BlocListener<CreatePageCubit, CreatePageState>(
                listener: (context, state) {
                  if (state.registerSuccess == true) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      LoginScreenView.routeName,
                      (route) => false,
                    );
                    emailController.clear();
                    userNameController.clear();
                    passwordController.clear();
                    confirmPasswordController.clear();
                  }
                },
                child: SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Form(
                      key: globalKey,
                      child: Column(
                        children: [
                          const Gap(20),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    color: AppColor.primaryGreen,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: theme.brightness == Brightness.light
                                            ? Colors.grey
                                            : Colors.black.withOpacity(0.5),
                                        offset: const Offset(2, 2),
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                  child: const Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const Gap(50),
                              const Center(
                                child: Text(
                                  "Create Account",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryGreen,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(20),
                          Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "Create an account so you can explore all the existing chats",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ),
                          const Gap(30),
                          EmailTextFormField(
                            controller: userNameController,
                            hintText: 'Enter Your UserName',
                            validator: validateUserName,
                            textInputAction: TextInputAction.next,
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                          ),
                          const Gap(20),
                          EmailTextFormField(
                            controller: emailController,
                            hintText: 'Enter Your Email',
                            validator: validateEmail,
                            textInputAction: TextInputAction.next,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                          const Gap(20),
                          PasswordTextField(
                            controller: passwordController,
                            hintText: 'Enter Your Password',
                            validator: validatePassword,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          const Gap(20),
                          PasswordTextField(
                            controller: confirmPasswordController,
                            hintText: 'Enter Your Confirm Password',
                            validator: (value) => validateConfirmPassword(value, passwordController.text),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          const Gap(40),
                          GestureDetector(
                            onTap: () {
                              if (globalKey.currentState!.validate()) {
                                context.read<CreatePageCubit>().createAccount(
                                      userName: userNameController.text.trim(),
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                              }
                            },
                            child: CustomButton(
                              screenHeight: screenHeight * 0.06,
                              onPressed: () {},
                              child: const Text(
                                "Create Account",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const Gap(30),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Already have an Account?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                " Login",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.primaryGreen,
                                ),
                              ),
                            ],
                          ),
                          const Gap(70),
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
                                    ImagePath.google,
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
                )),
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
