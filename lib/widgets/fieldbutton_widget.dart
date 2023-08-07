import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

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
  @override
  Widget build(BuildContext context) {
    final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return Container(
      height: widget.height,
      width: widget.width,
      // decoration: BoxDecoration(
      //     border: Border.all(width: 1, color: Color.fromRGBO(94, 94, 94, 1)),
      //     borderRadius: BorderRadius.circular(10)),
      decoration: theme == Brightness.light?neu_Morphism : dark_neu_Morphism,
      // BoxDecoration(
      //     borderRadius: BorderRadius.circular(20),
      //     color: Color.fromRGBO(238, 238, 238, 1),
      //     boxShadow: [
      //       BoxShadow(
      //         blurRadius: 10,
      //         offset: Offset(7,7),
      //         color: Color.fromRGBO(184, 182, 182, 1.0),
      //       ),
      //       BoxShadow(
      //         blurRadius: 5,
      //         offset: Offset(-7,-7),
      //         color: Color.fromRGBO(245, 245, 245, 1.0),
      //       ),
      //     ]
      // ),
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
