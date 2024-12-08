import 'package:bloc/bloc.dart';
import 'package:chat_app/src/package/resocues/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../package/utils/logger.dart';

part 'choose_image_page_state.dart';

class ChooseImagePageCubit extends Cubit<ChooseImagePageState> {
  ChooseImagePageCubit(super.initialState, {required this.context}) {
    currentUserData();
  }

  final BuildContext context;
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  Future<void> currentUserData() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final userData = await _fireStore.collection('Users').doc(user.uid).get();
        final userName = userData['userName'] as String;

        emit(state.copyWith(userName: userName));
      }
    } catch (e) {
      Log.error(e.toString());
      emit(state.copyWith(errorMsg: e.toString()));
    }
  }

  Future<void> updateUsername(String firstName, String? about) async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _fireStore.collection('Users').doc(user.uid).update({
          'userName': firstName,
          'about': about,
        });
      }
      Log.debug(about);
      emit(state.copyWith(userName: firstName, about: about));
    } catch (e) {
      Log.error(e);
      emit(state.copyWith(errorMsg: e.toString()));
    }
  }

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        // Crop the image
        final croppedImage = await ImageCropper().cropImage(
          sourcePath: pickedImage.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Image Crop',
              toolbarColor: AppColor.primaryGreen,
              toolbarWidgetColor: Colors.white,
              activeControlsWidgetColor: AppColor.primaryGreen,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
            ),
            IOSUiSettings(
              title: 'Cropper',
            ),
            WebUiSettings(
              context: context,
            ),
          ],
        );

        if (croppedImage != null) {
          emit(state.copyWith(pickedImagePath: croppedImage.path, errorMsg: null));
        } else {
          emit(state.copyWith(errorMsg: 'Image cropping cancelled.'));
        }
      } else {
        emit(state.copyWith(errorMsg: 'No image selected.'));
      }
    } catch (e) {
      Log.error('Error picking image: $e');
      emit(state.copyWith(errorMsg: 'Error: ${e.toString()}'));
    }
  }
}
