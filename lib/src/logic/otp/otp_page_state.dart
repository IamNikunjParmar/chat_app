part of 'otp_page_cubit.dart';

class OtpPageState extends Equatable {
  const OtpPageState({this.errorMsg = '', this.isLoading = false, this.isVerified = false, this.verificationId = ''});

  final String errorMsg;
  final bool isLoading;
  final bool isVerified;
  final String verificationId;

  OtpPageState copyWith({
    String? errorMsg,
    bool? isLoading,
    bool? isVerified,
    String? verificationId,
  }) {
    return OtpPageState(
      errorMsg: errorMsg ?? this.errorMsg,
      isLoading: isLoading ?? this.isLoading,
      isVerified: isVerified ?? this.isVerified,
      verificationId: verificationId ?? this.verificationId,
    );
  }

  @override
  List<Object> get props => [
        errorMsg,
        isLoading,
        isVerified,
        verificationId,
      ];
}
