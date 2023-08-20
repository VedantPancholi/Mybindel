import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:provider/provider.dart';

class postOptionsWithoutBadge extends StatelessWidget {
  final size;

  String text;
  String svg;

  postOptionsWithoutBadge(
      {super.key,
      required this.size,
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
                          horizontal: size.width * 0.020),
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: size.height * 0.005,
                              horizontal: size.width * 0.015),
                          padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.012,
                              horizontal: size.width * 0.015),
                          width: size.width * 0.170,
                          height: size.height * 0.060,
                          decoration: provider.currentTheme
                              ? square_neu_Morphism
                              : square_dark_neu_Morphism,
                          child: Row(children: [
                            SvgPicture.asset(svg),
                            SizedBox(width: size.width*0.020,),
                            AutoSizeText(
                              text,
                              style: TextStyle(
                                fontSize: 15,
                                color:
                                    provider.currentTheme ? dim_black : dim_white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ])),
                    );
  }
}
