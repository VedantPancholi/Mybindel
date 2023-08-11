import 'dart:ui';

import 'package:mybindel_test/palette/palette.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectTheme {
  static bool userSelected = false;

 static void selectTheme(Brightness theme) async {
    if((theme == Brightness.light && userSelected == true) || (theme == Brightness.dark && userSelected == false)){
      // dark theme
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('currentTheme');
      pref.setBool('currentTheme',false);
      // return false;

    }
    if((theme == Brightness.light && userSelected == false) || theme == Brightness.dark && userSelected == true){
      //light theme
      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.remove('currentTheme');
      pref.setBool('currentTheme',true);
      // return true;
    }


    // else if(theme == Brightness.dark && userSelected == true){
    //   //light theme
    //
    // }
    // else if(theme == Brightness.dark && userSelected == false){
    //   //dark theme
    //
    // }
  }

  static void toggleTheme(int i){
    if(i == 0){
      userSelected = false;
    }
    if(i == 1){
      userSelected = true;
    }
  }
}