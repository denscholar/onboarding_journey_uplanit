// import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService _singleton = ApiService();
  static ApiService get instance => _singleton;
  final String _baseUrl = 'https://uplanit-test-api.herokuapp.com/public';

  Future<dynamic> fetchData(String endpoint) async {
    final response = await http.get(_baseUrl + endpoint);
    if (response.statusCode == 200) {
      return response.body;
    }
    throw 'An error occured. Can\'t fetch resource at this time';
  }
}
