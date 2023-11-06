import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User();

  late num cusid;
  late String name;
  late String address;
  late num phone;
  late String username;
  late String password;
  
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
