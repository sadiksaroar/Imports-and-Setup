
import 'dart:convert';

import 'package:api_1/code/model.dart';
import 'package:http/http.dart' as http;

class ApiSevice{
  Future<List<User>> fetchUsers (int page ) async{
    final response = await http.get(Uri.parse("https://reqres.in/api/users?page=2"));

    if (response.statusCode == 200){
      final data = json.decode(response.body);
      List<User> users = (data['data'] as List).map((json) => User.fromJson(json)).toList();
      return users;
    }
    else{
      throw Exception('Faild to lOad ');
    }
  }
}