import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapi/models/basket.dart';
import 'package:testapi/models/baskets.dart';


class ServicesBasket {
  static const String url = "http://192.168.1.51/api/basket";

  static Future<Baskets> getBasket() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode){
        return parseBasket(response.body);
      } else {
        return Baskets();
      }
    } catch (e) {
      return Baskets();
    }
  }


  static Baskets parseBasket(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<Basket> baskets = parsed.map<Basket>((json) => Basket.fromJson(json)).toList();
    Baskets b = Baskets();
    b.baskets = baskets;
    return b;
  }

  static Future<void> data_str(String fid) async {
    try {
      final response = await http.get(Uri.parse(url + '/' + fid));
    } catch (e) {
      Baskets();
    }
  }
  
  static Future<void> reData(String fid) async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.51/api/basketre/'+fid));
    } catch (e) {
      Baskets();
    }
  }

  static Future<void> pData(String fid) async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.51/api/basketp/'+fid));
    } catch (e) {
      Baskets();
    }
  }
}