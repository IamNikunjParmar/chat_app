part of 'login_page_cubit.dart';

class LoginPageState extends Equatable {
  final bool isValidPhoneNumber;
  final String errorMsg;
  final String verificationId;
  final bool isLoading;

  const LoginPageState({
    this.isValidPhoneNumber = false,
    this.errorMsg = '',
    this.verificationId = '',
    this.isLoading = false,
  });

  LoginPageState copyWith({bool? isValidPhoneNumber, String? errorMsg, String? verificationId, bool? isLoading}) {
    return LoginPageState(
      isValidPhoneNumber: isValidPhoneNumber ?? this.isValidPhoneNumber,
      errorMsg: errorMsg ?? this.errorMsg,
      verificationId: verificationId ?? this.verificationId,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        isValidPhoneNumber,
        errorMsg,
        verificationId,
        isLoading,
      ];
}
