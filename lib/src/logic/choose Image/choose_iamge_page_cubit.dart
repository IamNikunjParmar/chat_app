import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'choose_iamge_page_state.dart';

class ChooseIamgePageCubit extends Cubit<ChooseIamgePageState> {
  ChooseIamgePageCubit() : super(ChooseIamgePageInitial());
}
