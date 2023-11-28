import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class BorderContainer extends StatelessWidget {
  int index;
  Decoration decoration;
  void Function(int i)? ontap;

  String color_name;
  BorderContainer({
    Key? key,
    required this.index,
    required this.decoration,
    required this.color_name,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        ontap!(index);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 1.0.h),
        width: (18.25).w,
        height: (12.0).h,
        // color: Colors.amber,
        child: Column(
          children: [
            Container(
              width: (16.25).w,
              height: (8.0).h,
              decoration: decoration,
              // decoration: provider.currentTheme ? square_neu_Morphism : square_dark_neu_Morphism,
            ),
            SizedBox(
              height: (1).h,
            ),
            Container(
                width: (18.25).w,
                height: (1.9).h,
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
      ),
    );
  }
}
