import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapi/models/index.dart';
import 'models/order.dart';
import 'models/orders.dart';

class ServicesOrder {
  static const String url = "http://192.168.1.51/api/orderss";

  static Orders parseOrder(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<Order> orders = parsed.map<Order>((json) => Order.fromJson(json)).toList();
    Orders o = Orders();
    o.orders = orders;
    return o;
  }

  static Future<Orders> getOrder() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode){
        return parseOrder(response.body);
      } else {
        return Orders();
      }
    } catch (e) {
      return Orders();
    }
  }
  
  static Future<void> delete_order() async {
    try{
      final response = await http.get(Uri.parse('http://192.168.1.51/api/order'));
    } catch (e){
      Orders();
    }
  }

  static Future<void> can_order(String oid) async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.51/api/hisc/'+oid));
    } catch (e) {
      Orders();
    }
  }
  
  static Future<void> suc_order(String oid) async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.51/api/hiss/'+oid));
    } catch (e) {
      Orders();
    }
  }

}