import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../palette/palette.dart';
import '../providers/selectTheme.dart';


class rowbutton extends StatefulWidget {
  String title;
  IconData icon;
  final Function()? onpressed;

  final EdgeInsetsGeometry? margin;
  final double iconHeight;
  final double iconWidth;
  final double width;

  rowbutton(
      {required this.title,
        required this.icon,
        required this.onpressed,
        this.margin,
        required this.iconHeight,
        required this.iconWidth,
        required this.width});

  @override
  State<rowbutton> createState() => _rowbuttonState();
}

class _rowbuttonState extends State<rowbutton> {
  // Future<bool?> getCurrentThemeInstance() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getBool('currentTheme');
  // }
  @override
  Widget build(BuildContext context) {
    // final current_theme = getCurrentThemeInstance();
    final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final provider = Provider.of<Themeprovider>(context);

    return GestureDetector(
      onTap: widget.onpressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: widget.margin,
            // decoration: BoxDecoration(
            //     color: Color.fromRGBO(242, 242, 242, 1),
            //     borderRadius: BorderRadius.circular(7)),
            decoration:  provider.currentTheme?neu_Morphism : dark_neu_Morphism,
            width: widget.iconWidth,
            height: widget.iconHeight,
            child: Icon(widget.icon,color: orange_color,),
          ),
          Container(
            decoration: BoxDecoration(
              //color: Color(0xffc20000),
                borderRadius: BorderRadius.circular(5)),
            // margin: widget.margin,
            width: widget.width,
            height: widget.iconHeight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Avant',
                  fontSize: 16,
                  // color: Color.fromRGBO(51, 51, 51, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
