import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:testapi/models/index.dart';
import 'models/user.dart';
import 'models/users.dart';

class ServicesUsers {
  static const String url = "http://192.168.1.51/api/customer";

  static Future<Users> getUsers() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode){
        return parseUsers(response.body);
      } else {
        return Users();
      }
    } catch (e) {
      return Users();
    }
  }

  static Users parseUsers(String reponseBody) {
    final parsed = json.decode(reponseBody).cast<Map<String, dynamic>>();
    List<User> users = parsed.map<User>((json) => User.fromJson(json)).toList();
    Users u = Users();
    u.users = users;
    return u;
  }
}