import 'dart:convert';

import 'package:api_test2/model.dart';

import 'package:http/http.dart' as http;

Future<List<TestCase>> fetchData() async {
  final rasponse = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/categories'));
  if (rasponse.statusCode == 200) {
    final data = jsonDecode(rasponse.body).cast<Map<String, dynamic>>();
    print(data);
    return data.map<TestCase>((json) => TestCase.fromJson(json)).toList();
  } else {
    throw Exception('failed to load');
  }
}
