import 'package:json_annotation/json_annotation.dart';
import "food.dart";
part 'foods.g.dart';

@JsonSerializable()
class Foods {
  Foods();

  late List<Food> foods;
  
  factory Foods.fromJson(Map<String,dynamic> json) => _$FoodsFromJson(json);
  Map<String, dynamic> toJson() => _$FoodsToJson(this);

  static Foods filterList(Foods foods, String filterString){
    Foods tempFoods = foods;
    List<Food> foodsList = tempFoods.foods
        .where((f) =>
    (f.name.toLowerCase().contains(filterString.toLowerCase()))
    ).toList();
    foods.foods = foodsList;
    return foods;
  }
}
