import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/scheduler.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';

import '../providers/selectTheme.dart';

class paymentoption extends StatefulWidget {
  final String title;
  final String image;
  final Function()? onpressed;
  final EdgeInsetsGeometry iconPadding;
  final EdgeInsetsGeometry? margin;
  final double iconHeight;
  final double iconWidth;
  final double width;
  final bool selecteditem;

  paymentoption(
      {required this.title,
        required this.image,
        required this.onpressed,
        this.margin,
        required this.iconHeight,
        required this.iconWidth,
        this.iconPadding = const EdgeInsets.all(10),
        this.selecteditem = false,
        required this.width});

  @override
  State<paymentoption> createState() => _paymentoptionState();
}

class _paymentoptionState extends State<paymentoption> {
  @override
  Widget build(BuildContext context) {
    final theme =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final provider = Provider.of<Themeprovider>(context);

    return GestureDetector(
      onTap: widget.onpressed,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AnimatedContainer(
              margin: widget.margin,
              decoration: provider.currentTheme
                  ? BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(240, 240, 240, 1),
                boxShadow: [
                  BoxShadow(
                    inset: widget.selecteditem,
                    blurRadius: widget.selecteditem ? 4 : 5,
                    offset: widget.selecteditem
                        ? Offset(3, 3)
                        : Offset(5, 5),
                    color: Color.fromRGBO(184, 182, 182, 1.0),
                  ),
                  BoxShadow(
                    inset: widget.selecteditem,
                    blurRadius: widget.selecteditem ? 2 : 5,
                    offset: widget.selecteditem
                        ? Offset(-3, -3)
                        : Offset(-5, -5),
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                  ),
                ],
              )
                  : BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromRGBO(25, 25, 25, 1.0),
                boxShadow: [
                  BoxShadow(
                    inset: widget.selecteditem,
                    blurRadius: widget.selecteditem ? 5 : 10,
                    offset: widget.selecteditem
                        ? Offset(3, 3)
                        : Offset(10, 10),
                    color: Color.fromRGBO(18, 18, 18, 1.0),
                  ),
                  BoxShadow(
                    inset: widget.selecteditem,
                    blurRadius: widget.selecteditem ? 4 : 3,
                    offset: widget.selecteditem
                        ? Offset(-4, -4)
                        : Offset(-3, -3),
                    color: Color.fromRGBO(60, 60, 60, 1.0),
                  ),
                ],
              ),
              duration: const Duration(microseconds: 100),
              width: widget.iconWidth,
              height: widget.iconHeight,
              child: Padding(
                padding: widget.iconPadding,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.contain,
                ),
              )),
          Container(
            decoration: BoxDecoration(
              //   color: widget.selecteditem,
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
