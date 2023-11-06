import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  Order();

  late num oid;
  late String cusid;
  late String address;
  late num phone;
  late String name;
  late num sumprice;
  
  factory Order.fromJson(Map<String,dynamic> json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
