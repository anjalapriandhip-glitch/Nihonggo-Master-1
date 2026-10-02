
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models.dart';

class DataService {
  static Future<List<Kotoba>> kotoba() async {
    final s = await rootBundle.loadString('assets/data/kotoba.json');
    return (jsonDecode(s) as List).map((e)=>Kotoba.fromJson(e)).toList();
  }
  static Future<List<Bunpo>> bunpo() async {
    final s = await rootBundle.loadString('assets/data/bunpo.json');
    return (jsonDecode(s) as List).map((e)=>Bunpo.fromJson(e)).toList();
  }
}
