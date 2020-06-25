import 'package:http/http.dart' as http;
import 'dart:convert';

Future loginUser(String email,String password) async {
  String url = 'https://surajyadavapi123.000webhostapp.com/flutter-php-api.php';
  final response =await http.post(
    url,
    headers : {"Accept" : "Application/json"},
    body : {'email' : email, 'password' : password}
  );
  var convertDataJson = jsonDecode(response.body);
  return convertDataJson;
}