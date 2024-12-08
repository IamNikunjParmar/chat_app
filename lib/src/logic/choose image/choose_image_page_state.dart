part of 'choose_image_page_cubit.dart';

class ChooseImagePageState extends Equatable {
  final String userName;
  final String lastName;
  final String about;
  final String errorMsg;
  final String pickedImagePath;

  const ChooseImagePageState({
    this.userName = '',
    this.lastName = '',
    this.about = '',
    this.errorMsg = '',
    this.pickedImagePath = '',
  });

  ChooseImagePageState copyWith({
    String? userName,
    String? lastName,
    String? about,
    String? errorMsg,
    String? pickedImagePath,
  }) {
    return ChooseImagePageState(
      userName: userName ?? this.userName,
      lastName: lastName ?? this.lastName,
      about: about ?? this.about,
      errorMsg: errorMsg ?? this.errorMsg,
      pickedImagePath: pickedImagePath ?? this.pickedImagePath,
    );
  }

  @override
  List<Object> get props => [
        userName,
        lastName,
        errorMsg,
        about,
        pickedImagePath,
      ];
}
