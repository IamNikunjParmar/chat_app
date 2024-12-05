import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

part 'otp_page_state.dart';

class OtpPageCubit extends Cubit<OtpPageState> {
  OtpPageCubit() : super(const OtpPageState());

  final _auth = FirebaseAuth.instance;
  final logg = Logger();

  Future<void> verifyOtp(String otp, String verificationId, BuildContext context) async {
    emit(state.copyWith(errorMsg: '', isLoading: true));
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      await _auth.signInWithCredential(credential);
      emit(state.copyWith(isLoading: false, isVerified: true));

      // Navigate to the next page upon successful OTP verification
      Navigator.pushNamed(context, 'next_page'); // Replace with your next page route
    } catch (e) {
      logg.e('OTP Verification Failed: $e');
      emit(state.copyWith(errorMsg: 'Invalid OTP', isLoading: false, isVerified: false));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP. Please try again.')),
      );
    }
  }

  Future<void> resendOtp(String phoneNumber) async {
    emit(state.copyWith(errorMsg: '', isLoading: true));
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          emit(state.copyWith(isLoading: false, isVerified: true));
        },
        verificationFailed: (FirebaseAuthException e) {
          logg.e('OTP Resend Failed: $e');
          emit(state.copyWith(errorMsg: 'OTP Resend Failed', isLoading: false));
        },
        codeSent: (String verificationId, int? resendToken) {
          emit(state.copyWith(
            isLoading: false,
            verificationId: verificationId,
          ));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          emit(state.copyWith(verificationId: verificationId));
        },
      );
    } catch (e) {
      logg.e('OTP Resend Failed: $e');
      emit(state.copyWith(
        errorMsg: 'OTP Resend Failed',
        isLoading: false,
      ));
    }
  }
}
