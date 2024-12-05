import 'package:chat_app/src/package/resocues/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final FormFieldValidator<String>? validator;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final ValueChanged? onSubmitted;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final String? labelText;
  final bool isReadOnly;
  final Widget? suffix;
  final AutovalidateMode? autovalidateMode;

  const EmailTextFormField({
    super.key,
    required this.controller,
    this.focusNode,
    this.autofocus = false,
    this.validator,
    this.autofillHints,
    this.textInputAction,
    this.onSubmitted,
    this.hintText,
    this.labelText,
    this.isReadOnly = false,
    this.suffix,
    this.onChanged,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (val) {
        FocusScope.of(context).unfocus();
      },
      validator: validator,
      controller: controller,
      focusNode: focusNode,
      autofocus: autofocus,
      autofillHints: autofillHints,
      textInputAction: textInputAction,
      onFieldSubmitted: onSubmitted,
      onChanged: onChanged,
      readOnly: isReadOnly,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        suffixIcon: suffix,
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(10),
        //   borderSide: const BorderSide(
        //     color: AppColor.primaryGreen,
        //     width: 2,
        //   ),
        // ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.primaryGreen,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.primaryGreen,
            width: 2,
          ),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColor.primaryGreen,
      autovalidateMode: autovalidateMode,
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.autofocus = false,
    this.validator,
    this.autofillHints,
    this.onSubmitted,
    this.textInputAction,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.suffix,
    this.keyboardType,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final bool autofocus;
  final FormFieldValidator<String>? validator;
  final Iterable<String>? autofillHints;
  final TextInputAction? textInputAction;
  final String? hintText;
  final String? labelText;
  final ValueChanged? onSubmitted;
  final Widget? prefixIcon;
  final Widget? suffix;
  final TextInputType? keyboardType;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      obscureText: !_isPasswordVisible,
      obscuringCharacter: "•",
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofillHints: widget.autofillHints,
      validator: widget.validator,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onSubmitted,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        errorMaxLines: 5,
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: IconButton(
          onPressed: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
          icon: Icon(
            _isPasswordVisible ? Icons.remove_red_eye : Icons.visibility_off,
            color: theme.brightness == Brightness.light ? Colors.grey : AppColor.primaryGreen,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.primaryGreen,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColor.primaryGreen,
            width: 2,
          ),
        ),
      ),
    );
  }
}
