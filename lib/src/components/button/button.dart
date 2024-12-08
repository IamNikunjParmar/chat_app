import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../package/resocues/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.screenHeight,
    this.text,
    this.onPressed,
    this.child,
    this.screenWidth,
  });

  final double screenHeight;
  final double? screenWidth;
  final String? text;
  final VoidCallback? onPressed;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: screenHeight,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.primaryGreen,
        borderRadius: const BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: theme.brightness == Brightness.light ? Colors.grey : Colors.black.withOpacity(0.5),
            offset: const Offset(3, 3),
            blurRadius: 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
