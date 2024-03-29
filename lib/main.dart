import 'package:flutter/material.dart';
import 'package:weather_app/src/app.dart';
import "package:weather_app/src/global.dart";
import 'package:shared_preferences/shared_preferences.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}