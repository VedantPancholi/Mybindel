import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Themeprovider extends ChangeNotifier {
  late bool lastpref  = true; // Default true
  late bool userpref  = false; // Default false
  late ThemePreferences _preferences;
  late Brightness theme;

  Themeprovider()  {
    print("Intial : ${lastpref}");
    print("Intial : ${userpref}");
    _preferences = ThemePreferences();
    getTheme();
    theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    print("After Constructor : ${lastpref}");
    print("After Constructor : ${userpref}");
  }

  bool get currentTheme => lastpref;

  getTheme() async {
    userpref = await _preferences.getUserPreference();
    lastpref = await _preferences.getFinalPreference();
    notifyListeners();
  }

  changeuserpref(int index) {
    if (index == 0) {
      userpref = false;
      setUserPreference(false);
    } else {
      userpref = true;
      setUserPreference(true);
    }
    changefinalpref();
    getFinalPreference();
    print("Change userpref: ${userpref}");
    print("final instance: ${lastpref}");
  }

  changefinalpref() {
    if ((theme == Brightness.light && userpref == false) ||
        (theme == Brightness.dark && userpref == true)) {
      // light  true
      setFinalPreference(true);
    }
    if ((theme == Brightness.dark && userpref == false) ||
        (theme == Brightness.light && userpref == true)) {
      // dark  false
      setFinalPreference(false);
    }
  }

  setUserPreference(bool value) {
    _preferences.setUserPreference(value);
  }

  setFinalPreference(bool value) {
    _preferences.setFinalPreference(value);
  }

  getFinalPreference() async {
    lastpref = await _preferences.getFinalPreference();
    notifyListeners();
  }
}

class ThemePreferences {
  setUserPreference(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setBool('user_pref', value);
  }

  Future<bool> getUserPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('user_pref') ?? false;
  }

  setFinalPreference(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setBool('final_pref', value);
  }

  Future<bool> getFinalPreference() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool('final_pref') ?? true;
  }
}
