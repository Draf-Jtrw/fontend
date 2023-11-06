import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/food.dart';
import 'models/foods.dart';

class Services {
  static const String url = "http://192.168.1.51/api/food/t";

  static Future<Foods> getFoods() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode){
        return parseFoods(response.body);
      } else {
        return Foods();
      }
    } catch (e) {
      return Foods();
    }
  }

  static Future<Foods> postFoods() async {
    try {
      final response = await http.post(Uri.parse(url));
      if (200 == response.statusCode){
        return parseFoods(response.body);
      } else {
        return Foods();
      }
    } catch (e) {
      return Foods();
    }
  }

  static Foods parseFoods(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<Food> foods = parsed.map<Food>((json) => Food.fromJson(json)).toList();
    Foods f = Foods();
    f.foods = foods;
    return f;
  }
}