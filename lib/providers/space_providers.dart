import 'dart:convert';

import 'package:cozy_findhouse/models/space.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SpaceProvider extends ChangeNotifier {
  getRecommendedSpace() async {
    var url = 'https://bwa-cozy.herokuapp.com/recommended-spaces';
    var result = await http.get(Uri.parse(url));

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
