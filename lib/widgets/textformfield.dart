import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/scheduler.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

import '../palette/palette.dart';
class textfields extends StatefulWidget {
  String hintText;
  TextInputType keybordType;
  TextEditingController textController;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  int? maxlength;
  IconData? icon;

  textfields(
      {required this.hintText,
        required this.keybordType,
        required this.textController,
        this.validator,
        this.onChanged,
        this.maxlength,
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
          maxLength: widget.maxlength,
        controller: widget.textController,
        decoration: InputDecoration(

          // errorBorder: OutlineInputBorder(
          //   borderSide: BorderSide(color: Color.fromRGBO(255, 83, 73, 0.3),width: 1),
          //   borderRadius: BorderRadius.circular(10.0),
          //
          // ),
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
        // keyboardType: TextInputType.number,
        textInputAction: TextInputAction.next,
        keyboardType: widget.keybordType,

        autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: widget.onChanged,
          validator: widget.validator
      ),
    );
  }
}
