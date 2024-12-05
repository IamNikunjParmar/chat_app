import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

class ShowSuccessToast {
  static void show(BuildContext context, String title, String description) {
    MotionToast.success(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      description: Text(
        description,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
      barrierColor: Colors.black38,
      width: double.infinity,
      height: 80,
      borderRadius: 16,
    ).show(context);
  }
}

class ShowErrorToast {
  static void show(BuildContext context, String title, String description) {
    MotionToast.error(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      description: Text(
        description,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
      displaySideBar: false,
      animationType: AnimationType.fromTop,
      position: MotionToastPosition.top,
      barrierColor: Colors.black38,
      width: double.infinity,
      height: 90,
      borderRadius: 16,
    ).show(context);
  }
}
