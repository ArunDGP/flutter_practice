import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_practice/model/model.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;


class DataViewModel extends ChangeNotifier {
  Future<List<Data>> getData() async {
    String url = "https://api.dictionaryapi.dev/api/v2/entries/en/hello";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> responseData = jsonDecode(response.body);
      final List<Data> dataModels = responseData.map((data) => Data.fromJson(data)).toList();
      //debugPrint(response.body);
      developer.log(response.body);
      return dataModels;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
