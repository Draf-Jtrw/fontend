// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..cusid = json['cusid'] as num
  ..name = json['name'] as String
  ..address = json['address'] as String
  ..phone = json['phone'] as num
  ..username = json['username'] as String
  ..password = json['password'] as String;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'cusid': instance.cusid,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'username': instance.username,
      'password': instance.password,
    };
