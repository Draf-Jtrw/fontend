import 'package:json_annotation/json_annotation.dart';
import "orderamount.dart";
part 'orderamounts.g.dart';

@JsonSerializable()
class Orderamounts {
  Orderamounts();

  late List<Orderamount> orderamounts;
  
  factory Orderamounts.fromJson(Map<String,dynamic> json) => _$OrderamountsFromJson(json);
  Map<String, dynamic> toJson() => _$OrderamountsToJson(this);
}
