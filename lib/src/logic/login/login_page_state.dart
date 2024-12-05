part of 'login_page_cubit.dart';

class LoginPageState extends Equatable {
  final bool loginSuccess;
  final bool isLoading;

  const LoginPageState({this.loginSuccess = false, this.isLoading = false});

  LoginPageState copyWith({bool? loginSuccess, bool? isLoading}) {
    return LoginPageState(
      loginSuccess: loginSuccess ?? this.loginSuccess,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        loginSuccess,
      ];
}
