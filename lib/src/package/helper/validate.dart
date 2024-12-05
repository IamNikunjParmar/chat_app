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

String? validateUserName(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return 'Please enter a username';
  } else if (!AppConstants.namePatternRegExp.hasMatch(value)) {
    return 'Invalid username format';
  }
  return null;
}

// Validate email
String? validateEmail(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return 'Please enter an email';
  } else if (!AppConstants.emailPatternRegExp.hasMatch(value)) {
    return 'Invalid email format';
  }
  return null;
} // Validate password

String? validatePassword(String? value) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return 'Please enter a password';
  } else if (!AppConstants.passwordPatternRegExp.hasMatch(value)) {
    return 'Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, and one number';
  }
  return null;
}

// Validate confirm password
String? validateConfirmPassword(String? value, String? password) {
  value = value?.trim() ?? "";
  if (value.isEmpty) {
    return 'Please confirm your password';
  } else if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}
