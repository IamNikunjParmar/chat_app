import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit() : super(const LoginPageState());

  final _auth = FirebaseAuth.instance;
  final logg = Logger();

  Future<void> sendOtp(String phoneNumber) async {
    emit(state.copyWith(errorMsg: '', verificationId: '', isLoading: true));
    try {
      final formattedPhoneNumber = '+91$phoneNumber';
      await _auth.verifyPhoneNumber(
        phoneNumber: formattedPhoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          emit(state.copyWith(isLoading: false));
        },
        verificationFailed: (FirebaseException e) {
          emit(state.copyWith(errorMsg: e.message ?? 'Verification failed', isLoading: false));
          logg.e('Verification failed: ${e.message}');
        },
        codeSent: (String verificationId, int? resendToken) {
          emit(state.copyWith(verificationId: verificationId, isLoading: false));
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          emit(state.copyWith(verificationId: verificationId, isLoading: false));
        },
        timeout: const Duration(seconds: 60),
      );
    } catch (e) {
      logg.e('Error: $e');
      emit(state.copyWith(errorMsg: e.toString(), isLoading: false));
    }
  }
}
