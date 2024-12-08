import 'package:bloc/bloc.dart';
import 'package:chat_app/src/ui/choose%20Image/choose_image_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../components/snackBar/snack_bar.dart';
import '../../package/utils/logger.dart';

part 'login_page_state.dart';

class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit(super.initialState, {required this.context});

  final auth = FirebaseAuth.instance;
  final BuildContext context;
  final _fireStore = FirebaseFirestore.instance;

  loginWithEmailAndPassword({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true));
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(state.copyWith(loginSuccess: true));
      ShowSuccessToast.show(context, "Success", 'Welcome For the Chatter Box App');
      return 'Login Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user not found') {
        ShowErrorToast.show(context, "Invalid credentials. Please check your email and password", '');
        return 'No user found for that email. ';
      } else if (e.code == 'wrong - password') {
        return ShowErrorToast.show(context, 'Failed', ' Wrong password provide that user.');
      } else {
        Log.error("FireBase Login Error :$e");
        ShowErrorToast.show(context, 'Failed', 'Invalid Email and Password');
        emit(state.copyWith(isLoading: false));
        return e.message;
      }
    }
  }

  Future<User?> loginWithGoogle() async {
    emit(state.copyWith(isLoading: true));
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth?.idToken,
        accessToken: googleAuth?.accessToken,
      );
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        final userDoc = await _fireStore.collection('Users').doc(user.uid).get();
        if (!userDoc.exists) {
          await _fireStore.collection('Users').doc(user.uid).set({
            'userName': user.displayName ?? 'Unknown User',
            'email': user.email,
            'id': user.uid,
          });
        }
        ShowSuccessToast.show(context, "Success", 'Welcome For the Chatter Box App');
        if (context.mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            ChooseImageView.routeName,
            (route) => false,
          );
        }
      } else {
        ShowErrorToast.show(context, 'Failed', 'Please try Again');
      }
    } catch (e) {
      Log.error(e);
      ShowErrorToast.show(context, 'Failed', e.toString());
      emit(state.copyWith(isLoading: false));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
    return null;
  }
}
