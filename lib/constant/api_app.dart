
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';


class AppApi {
  final String appUri = 'https://api.weatherapi.com/v1/forecast.json?key=78f15b3db0ad41e6964212212241412&q=';

  List<String> cities = ['07112', 'London', 'New York', 'Paris', 'Cairo', 'Germany'];

  Future<Map<String, dynamic>> weatherApiCall(String city) async {
    final response = await http.get(Uri.parse("$appUri$city"));
    if (response.statusCode == 200) {
     return jsonDecode(response.body);
    }
    else {
      throw Exception("Failed to fetch data ${response.statusCode}");
    }
  }
  Future<void> openUrl(String url) async {
    final Uri uri=Uri.parse(url);
    if (!await launchUrl(uri)){
throw Exception('Cannt launch $uri')  ;
    }

  }
}