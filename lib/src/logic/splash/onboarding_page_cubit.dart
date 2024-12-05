import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'onboarding_page_state.dart';

class OnboardingPageCubit extends Cubit<OnboardingPageState> {
  OnboardingPageCubit() : super(const OnboardingPageState());

  void pageChange(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
