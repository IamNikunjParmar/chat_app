part of 'onboarding_page_cubit.dart';

class OnboardingPageState extends Equatable {
  final int currentIndex;

  const OnboardingPageState({this.currentIndex = 0});

  OnboardingPageState copyWith({int? currentIndex}) {
    return OnboardingPageState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [currentIndex];
}
