part of 'create_page_cubit.dart';

class CreatePageState extends Equatable {
  final bool registerSuccess;
  final bool isLoading;

  const CreatePageState({
    this.registerSuccess = false,
    this.isLoading = false,
  });

  CreatePageState copyWith({bool? registerSuccess, bool? isLoading}) {
    return CreatePageState(
      isLoading: isLoading ?? this.isLoading,
      registerSuccess: registerSuccess ?? this.registerSuccess,
    );
  }

  @override
  List<Object> get props => [isLoading, registerSuccess];
}
