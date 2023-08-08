import 'dart:ui';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/scheduler.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

Color light_Scaffold_color = Color.fromRGBO(242, 242, 242, 1);
Color dark_Scaffold_color = Color.fromRGBO(26, 26, 26, 1.0);
Color orange_color = Color.fromRGBO(255, 83, 73, 1);

final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;

BoxDecoration neu_Morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
    color: Color.fromRGBO(240, 240, 240, 1),
    boxShadow: [
      BoxShadow(
        blurRadius: 5,
        offset: Offset(5, 3),
        color: Color.fromRGBO(164, 162, 162, 1.0),
      ),
      BoxShadow(
        blurRadius: 25,
        offset: Offset(-5, -7),
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
    ]);

BoxDecoration dark_neu_Morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
    color: Color.fromRGBO(25, 25, 25, 1.0),
    boxShadow: [
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
    ]);



BoxDecoration textFormField_neu_morphism = BoxDecoration(

    borderRadius: BorderRadius.circular(10),
    color: Color.fromRGBO(240, 240, 240, 1),
    boxShadow: [
      BoxShadow(
        inset: true,
        blurRadius: 5,
        offset: Offset(3,3),
        color: Color.fromRGBO(184, 182, 182, 1.0),
      ),
      BoxShadow(
        inset: true,
        blurRadius: 7,
        offset: Offset(-7,-7),
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
    ]
);


BoxDecoration dark_textFormField_neu_morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Color.fromRGBO(30, 30, 30, 1.0),
    boxShadow: [
      BoxShadow(
        inset: true,
        blurRadius: 5,
        offset: Offset(3,3),
        color: Color.fromRGBO(10, 10, 10, 1.0),
      ),
      BoxShadow(
        inset: true,
        blurRadius: 7,
        offset: Offset(-7,-7),
        color: Color.fromRGBO(35, 35, 35, 1.0),
      ),
    ]
);


