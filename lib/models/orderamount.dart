import 'package:json_annotation/json_annotation.dart';

part 'orderamount.g.dart';

@JsonSerializable()
class Orderamount {
  Orderamount();

  late num oid;
  late num fid;
  late num amount;
  late num price;
  late String pic;
  late String name;
  
  factory Orderamount.fromJson(Map<String,dynamic> json) => _$OrderamountFromJson(json);
  Map<String, dynamic> toJson() => _$OrderamountToJson(this);
}
