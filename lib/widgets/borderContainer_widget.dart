// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';

class BorderContainer extends StatelessWidget {
  Color color;
  String color_name;
  BorderContainer({
    Key? key,
    required this.color,
    required this.color_name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.0.h),
      width: (18.25).w,
      height: (12.0).h,
      // color: Colors.amber,
      child: Column(
        children: [
          Container(
            width: (16.25).w,
            height: (8.0).h,
            decoration: provider.currentTheme
                ? BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                color: color,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 2,
                    offset: Offset(2, 2),
                    color: Color.fromRGBO(184, 182, 182, 1.0),
                  ),
                  BoxShadow(
                    blurRadius: 5,
                    offset: Offset(-5, -7),
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                  ),
                ])
                : BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                color: color,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    offset: Offset(5, 7),
                    color: Color.fromRGBO(18, 18, 18, 1.0),
                  ),
                  BoxShadow(
                    blurRadius: 3,
                    offset: Offset(-3, -5),
                    color: Color.fromRGBO(33, 33, 33, 1.0),
                  ),
                ]),
            // decoration: provider.currentTheme ? square_neu_Morphism : square_dark_neu_Morphism,
          ),
          SizedBox(
            height: (1).h,
          ),
          Container(
              width: (18.25).w,
              height: (1.25).h,
              alignment: Alignment.center,
              child: AutoSizeText(
                color_name,
                softWrap: true,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              )),
        ],
      ),
    );
  }
}
