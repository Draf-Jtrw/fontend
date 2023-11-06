import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapi/models/historys.dart';
import 'models/history.dart';
import 'models/historys.dart';

class ServicesHistory {

  static Historys parseHistorys(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<History> historys = parsed.map<History>((json) => History.fromJson(json)).toList();
    Historys h = Historys();
    h.historys = historys;
    return h;
  }

  static Historys historyCan(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<History> historyCan = parsed.map<History>((json) => History.fromJson(json)).toList();
    Historys h = Historys();
    h.historyCan = historyCan;
    return h;
  }


  static Future<Historys> getSuc() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.51/api/hs'));
      if(200 == response.statusCode){
        return parseHistorys(response.body);
      }else{
        return Historys();
      }
    }catch (e){
      return Historys();
    }
  }

  static Future<Historys> getCan() async {
    try {
      final response = await http.get(Uri.parse('http://192.168.1.51/api/hc'));
      if(200 == response.statusCode){
        return historyCan(response.body);
      }else{
        return Historys();
      }
    }catch (e){
      return Historys();
    }
  }
}