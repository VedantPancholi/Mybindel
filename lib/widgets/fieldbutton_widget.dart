import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../palette/palette.dart';

class fieldbutton extends StatefulWidget {



  final String title;
  final Function()? onpressed;
  final EdgeInsetsGeometry? padding;
  final double height;
  final double width;

  fieldbutton(
      {required this.title,
        required this.onpressed,
        required this.height,
        required this.width,
        this.padding});

  @override
  State<fieldbutton> createState() => _fieldbuttonState();
}

class _fieldbuttonState extends State<fieldbutton> {
  // Future<bool?> getCurrentThemeInstance() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getBool('currentTheme');
  // }
  @override
  Widget build(BuildContext context) {
  // final current_theme = getCurrentThemeInstance();
    final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return Container(
      height: widget.height,
      width: widget.width,
      decoration:  theme == Brightness.light?neu_Morphism : dark_neu_Morphism,
      padding: widget.padding,
      child: InkWell(
        onTap: widget.onpressed,
        child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                  color: orange_color,
                  fontSize: 20,
                  // fontFamily: 'Avant',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                  height: 0.7),
            )),
      ),
    );
  }
}
