// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModal _$UserModalFromJson(Map<String, dynamic> json) => UserModal(
      about: json['about'] as String?,
      email: json['email'] as String?,
      id: json['id'] as String?,
      lastName: json['lastName'] as String?,
      userName: json['userName'] as String?,
      profilePic: json['profilePic'] as String?,
    );

Map<String, dynamic> _$UserModalToJson(UserModal instance) => <String, dynamic>{
      'about': instance.about,
      'email': instance.email,
      'id': instance.id,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'profilePic': instance.profilePic,
    };
