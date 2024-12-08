import 'package:json_annotation/json_annotation.dart';

part 'user_modal.g.dart';

@JsonSerializable()
class UserModal {
  String? about;
  String? email;
  String? id;
  String? lastName;
  String? userName;
  String? profilePic;

  UserModal({
    this.about,
    this.email,
    this.id,
    this.lastName,
    this.userName,
    this.profilePic,
  });

  factory UserModal.fromJson(Map<String, dynamic> json) => _$UserModalFromJson(json);

  Map<String, dynamic> toJson() => _$UserModalToJson(this);
}
