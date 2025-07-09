import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpClient {
  Future<Map<String, dynamic>> get(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
