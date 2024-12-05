import '../resocues/app_constanst.dart';

String? validateNumber(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return 'Please enter a number';
  } else if (value.length < 10) {
    return 'Mobile no length mini 10';
  }
  if (!AppConstants.numberRegExp.hasMatch(value)) {
    return 'Invalid number format';
  }
  return null;
}
