import 'package:json_annotation/json_annotation.dart';

part 'basket.g.dart';

@JsonSerializable()
class Basket {
  Basket();

  late num bid;
  late num cusid;
  late num fid;
  late num amount;
  late num price;
  late String pic;
  late String name;
  
  factory Basket.fromJson(Map<String,dynamic> json) => _$BasketFromJson(json);
  Map<String, dynamic> toJson() => _$BasketToJson(this);
}
