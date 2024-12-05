import 'package:chat_app/src/logic/otp/otp_page_cubit.dart';
import 'package:chat_app/src/package/resocues/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

import '../../logic/login/login_page_cubit.dart';

class OtpScreenView extends StatelessWidget {
  const OtpScreenView({super.key});

  static const String routeName = 'otp_page_view';
  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpPageCubit(),
      child: const OtpScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final verificationId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: AppColor.primaryGreen,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: theme.brightness == Brightness.light ? Colors.white : Colors.grey[900],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  size: 20,
                  color: AppColor.primaryGreen,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Container(
                height: screenHeight * 0.75,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: theme.brightness == Brightness.light ? Colors.white : Colors.grey[900],
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Gap(15),
                      Text(
                        "OTP Verification",
                        style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "We will send you a one-time password on this",
                        style: textTheme.bodyMedium,
                      ),
                      Text(
                        "+91 - 12989200823",
                        style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const Gap(60),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Pinput(
                          length: 6,
                          defaultPinTheme: PinTheme(
                            width: 50,
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 6),
                            textStyle: textTheme.headlineMedium?.copyWith(
                              color: theme.brightness == Brightness.light ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: AppColor.primaryGreen,
                                width: 2,
                              ),
                            ),
                          ),
                          focusedPinTheme: PinTheme(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: AppColor.primaryGreen,
                                width: 2,
                              ),
                            ),
                          ),
                          onCompleted: (otp) {
                            context.read<OtpPageCubit>().verifyOtp(otp, verificationId, context);
                          },
                        ),
                      ),
                      const Gap(30),
                      Text(
                        "00:00",
                        style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Did not send OTP? ",
                            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: () {
                              //   context.read<OtpPageCubit>().resendOtp(phoneNumber);
                            },
                            child: const Text(
                              "Send OTP",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryGreen,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(120),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            final otp = '';
                            context.read<OtpPageCubit>().verifyOtp(otp, verificationId, context);
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Submit",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
