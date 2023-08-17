import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeprovider extends ChangeNotifier {
  static bool lastpref  = true; // Default true
  static bool userpref  = false; // Default false

  late ThemePreferences _preferences;
  late Brightness theme;

  Themeprovider() {
    _preferences = ThemePreferences();
    getTheme();

  }

  bool get currentTheme => lastpref;

  getTheme() async {
    lastpref = await _preferences.getFinalPreference();
    print("After Constructor lastpref : ${lastpref}");
    print("After Constructor userpref : ${userpref}");
  }

  changeuserpref(int index) async {
    if (index == 0) {
      userpref = false;
    } else {
      userpref = true;
      await changefinalpref();
      await getFinalPreference();
    }


  }

  changefinalpref() {
    if (lastpref == false && userpref == true) {
      // light  true
      setFinalPreference(true);
    }
    if (lastpref == true && userpref == true) {
      // dark  false
      setFinalPreference(false);
    }
  }


  setFinalPreference(bool value) {
    _preferences.setFinalPreference(value);
  }

  getFinalPreference() async {
    lastpref = await _preferences.getFinalPreference();
    notifyListeners();
    print("Change userpref: ${userpref}");
    print("final instance: ${lastpref}");
  }
}

class ThemePreferences {

  setFinalPreference(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('final_pref', value);
  }

  Future<bool> getFinalPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('final_pref')??true;
    }
}