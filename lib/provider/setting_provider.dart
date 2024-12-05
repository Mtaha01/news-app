import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  String currentLang='en';
  void changeAppLang(String lang){
    if(lang==currentLang)
      return;
    currentLang=lang;
    notifyListeners();
  }
}