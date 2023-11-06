import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable()
class Food {
  Food();

  late num fid;
  late String name;
  late String type;
  late num price;
  late String pic;
  
  factory Food.fromJson(Map<String,dynamic> json) => _$FoodFromJson(json);
  Map<String, dynamic> toJson() => _$FoodToJson(this);
}
