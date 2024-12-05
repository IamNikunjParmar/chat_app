import 'package:bloc/bloc.dart';
import 'package:chat_app/src/components/snackBar/snack_bar.dart';
import 'package:chat_app/src/package/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'create_page_state.dart';

class CreatePageCubit extends Cubit<CreatePageState> {
  CreatePageCubit(super.initialState, {required this.context});

  final BuildContext context;

  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  createAccount({required String userName, required String email, required String password}) async {
    try {
      final newUser = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await fireStore.collection('Users').doc(newUser.user!.uid).set({
        'userName': userName,
        'email': email,
        'id': newUser.user!.uid,
      });

      User? user = newUser.user;
      Log.debug(user);

      return 'Register Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak password') {
        return ShowErrorToast.show(context, 'Failed', 'password is too weak please  enter Your Strong Password');
      } else if (e.code == 'email-already-use') {
        return ShowErrorToast.show(context, 'Failed', 'The Account is the Already exists');
      } else {
        Log.error("FirebaseException Error : $e");
        return ShowErrorToast.show(context, 'Failed', 'Invalid Email and Password');
      }
    } catch (e) {
      Log.error(e);
    }
  }
}
