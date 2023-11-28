import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class postOptions extends StatelessWidget {
  final size;
  bool showNotification;
  int notification_number;
  String text;
  String svg;

  postOptions(
      {super.key,
        required this.size,
        required this.notification_number,
        required this.showNotification,
        required this.text,
        required this.svg});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    return Container(
      width: size.width * 0.45,
      height: size.height * 0.065,
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.010,
        horizontal: size.width * 0.020,
      ),
      //  color: Colors.amber,
      child: badges.Badge(
        badgeAnimation: badges.BadgeAnimation.slide(),
        badgeContent: AutoSizeText(
          notification_number.toString(),
          style: TextStyle(color: Color.fromRGBO(242,242,242,1.0),fontSize: 10,fontWeight: FontWeight.bold),
        ),
        badgeStyle: badges.BadgeStyle(
          badgeColor: orange_color,
          padding: EdgeInsets.all(5),
        ),
        position: badges.BadgePosition.custom(
          top: -1,
          end: -2,
        ),
        showBadge: showNotification,
        child: Container(
            margin: EdgeInsets.symmetric(
                vertical: size.height * 0.005, horizontal: size.width * 0.015),
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.010, horizontal: size.width * 0.015),
            width: size.width * 0.420,
            height: size.height * 0.060,
            decoration: provider.currentTheme
                ? square_neu_Morphism
                : square_dark_neu_Morphism,
            child: Row(children: [
              Container(
                  height: (3).h, width: (5).w,
                  child: SvgPicture.asset(svg)
              ),
              SizedBox(width: size.width * 0.030),
              AutoSizeText(
                text,
                style: TextStyle(
                  fontSize: 15,
                  color: provider.currentTheme ? dim_black : dim_white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ])),
      ),
    );
  }
}
