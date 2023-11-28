import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../palette/palette.dart';
import '../providers/selectTheme.dart';
class textfields extends StatefulWidget {

  List<TextInputFormatter>? inputFormatters;
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
        this.icon,
        this.inputFormatters,});

  @override
  State<textfields> createState() => _textfieldState();
}

class _textfieldState extends State<textfields> {

  // Future<bool?> getCurrentThemeInstance() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getBool('currentTheme');
  // }

  @override
  Widget build(BuildContext context) {
    // final current_theme = getCurrentThemeInstance();
    final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final provider = Provider.of<Themeprovider>(context);

    return Container(
      //decoration
      decoration:  provider.currentTheme?textFormField_neu_morphism:dark_textFormField_neu_morphism,
      child: TextFormField(
          inputFormatters: widget.inputFormatters,
          maxLength: widget.maxlength,
          controller: widget.textController,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0),
            border: InputBorder.none,
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
