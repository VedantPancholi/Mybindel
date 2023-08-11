import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../palette/palette.dart';
import 'rowbutton_widget.dart';

Widget creatorButton(size) {
  // Future<bool?> getCurrentThemeInstance() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getBool('currentTheme');
  // }
  // final current_theme = getCurrentThemeInstance();
  final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
  return Expanded(
    child: Container(
      width: size.width,
      // color: Colors.green,
      decoration: BoxDecoration(
      color:  theme == Brightness.light
      ? light_Scaffold_color
      : dark_Scaffold_color,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.020,
                  horizontal: size.width * 0.050),
              child: Text(
                "Don’t have one?",
                style: TextStyle(
                    // fontFamily: 'Avant',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    // color: Color.fromRGBO(51, 51, 51, 1),
                    letterSpacing: 1),
              )),
          rowbutton(
            title: 'Create using E-mail',
            icon: Icons.email_outlined,
            onpressed: () {
              print("Email pressed");
            },
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.005, horizontal: size.width * 0.087),
            iconHeight: size.height * 0.07,
            iconWidth: size.width * 0.14,
            width: size.width * 0.60,
          ),
          rowbutton(
            title: 'Create using Phone',
            icon: Icons.phone,
            onpressed: () {
              print("Phone pressed");
            },
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.005, horizontal: size.width * 0.087),
            iconHeight: size.height * 0.07,
            iconWidth: size.width * 0.14,
            width: size.width * 0.60,
          ),
          rowbutton(
            title: 'Continue with Google',
            icon: Icons.search,
            onpressed: () {
              print("Search pressed");
            },
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.005, horizontal: size.width * 0.087),
            iconHeight: size.height * 0.07,
            iconWidth: size.width * 0.14,
            width: size.width * 0.60,
          ),
          rowbutton(
            title: 'Continue with Apple',
            icon: Icons.apple,
            onpressed: () {
              print("Apple pressed");
            },
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.005, horizontal: size.width * 0.087),
            iconHeight: size.height * 0.07,
            iconWidth: size.width * 0.14,
            width: size.width * 0.60,
          )
        ],
      ),
    ),
  );
}
