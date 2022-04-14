import 'dart:convert';

import 'package:gridview_test_with_api/model/names.dart';
import 'package:http/http.dart' as http;

class NetworkRequest {
  static const String url = 'https://api.aladhan.com/asmaAlHusna';
  static String? _index;
  static List<String> numsList = [];

  static Future<List<Data>> fetchNames() async {
    for (int i = 1; i < 10; i++) {
      _index = i.toString();
      numsList.add(_index!);
    }
    String urlIndex = numsList.join(',');
    final response = await http.get(
      Uri.parse('$url/$urlIndex'),
    );
    print(response.body);
    if (response.statusCode == 200) {
      var parsed = jsonDecode(response.body);
      var names =
          (parsed['data'] as List).map((e) => Data.fromJson(e)).toList();
      return names;
    } else {
      throw Exception('Can\'t get names ${response.statusCode}');
    }
  }
}
