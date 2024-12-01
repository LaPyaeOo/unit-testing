import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/user.dart';

class ApiService {
  final http.Client client;

  ApiService(this.client);

  Future<List<User>> fetchUser() async {
    final response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users/'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      // return User.fromJson(response.body);
      return jsonData.map((json)=> User.fromJson(json)).toList();
    }
    throw Exception('Some Error Occurred');
  }
}
