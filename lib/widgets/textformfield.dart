import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/scheduler.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../palette/palette.dart';
class textfields extends StatefulWidget {
  String hintText;
  TextInputType keybordType;
  TextEditingController textController;
  IconData? icon;

  textfields(
      {required this.hintText,
        required this.keybordType,
        required this.textController,
        this.icon});

  @override
  State<textfields> createState() => _textfieldState();
}

class _textfieldState extends State<textfields> {
  @override
  Widget build(BuildContext context) {
    final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return Container(
      //decoration
      decoration: theme == Brightness.light?textFormField_neu_morphism:dark_textFormField_neu_morphism,
      child: TextFormField(

        controller: widget.textController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0),
          border: InputBorder.none,
          //
          // border: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.black),
          //   borderRadius: BorderRadius.circular(20.0),
          // ),
          // focusedBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.black),
          //   borderRadius: BorderRadius.circular(20.0),
          // ),
          prefixIcon: widget.icon != null
              ? Icon(
            widget.icon,
            color: Colors.black,
            size: 22,
          )
              : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              fontSize: 14,
              // fontFamily: 'Avant',
              // color: Color.fromRGBO(94, 94, 94, 1),
              letterSpacing: 1,
              fontWeight: FontWeight.w500),
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return "Enter correct Email or Password";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
