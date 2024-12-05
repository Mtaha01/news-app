import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sat/my_app.dart';
import 'package:news_app_c12_online_sat/provider/setting_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create:(context)=>SettingsProvider(),child:const MyApp()),
  );
}
