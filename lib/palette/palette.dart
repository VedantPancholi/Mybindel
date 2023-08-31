import 'dart:ui';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

Color light_Scaffold_color = Color.fromRGBO(242, 242, 242, 1.0);
Color dark_Scaffold_color = Color.fromRGBO(26, 26, 26, 1.0);

Color orange_color = Color.fromRGBO(255, 83, 73, 1.0);

Color dim_white = Color.fromRGBO(236, 232, 232, 0.9686274509803922);
Color dim_black = Color.fromRGBO(51, 51, 51, 0.9686274509803922);

// bool isPressed = true;

BoxDecoration neu_Morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
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
    borderRadius: BorderRadius.circular(10),
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


BoxDecoration square_neu_Morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
    color: Color.fromRGBO(240, 240, 240, 1),
    boxShadow: [
      BoxShadow(
        blurRadius: 2,
        offset: Offset(2, 2),
        color: Color(0xFFB8B6B6),
      ),
      BoxShadow(
        blurRadius: 5,
        offset: Offset(-5, -7),
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
    ]);

BoxDecoration square_dark_neu_Morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
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



BoxDecoration music_listTile_neu_Morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
    color: Color.fromRGBO(240, 240, 240, 1),
    boxShadow: const [
      BoxShadow(
        blurRadius: 1,
        offset: Offset(1, 1),
        color: Color.fromRGBO(184, 182, 182, 1.0),
      ),
      BoxShadow(
        blurRadius: 2,
        offset: Offset(-2, -2),
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
    ]);

BoxDecoration music_listTile_dark_neu_Morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
    color: Color.fromRGBO(25, 25, 25, 1.0),
    boxShadow: const [
      BoxShadow(
        blurRadius: 1,
        offset: Offset(1, 1),
        color: Color.fromRGBO(18, 18, 18, 1.0),
      ),
      BoxShadow(
        blurRadius: 2,
        offset: Offset(-2, -2),
        color: Color.fromRGBO(33, 33, 33, 1.0),
      ),
    ]);

BoxDecoration selected_square_neu_Morphism = BoxDecoration(
    color: const Color.fromRGBO(255, 221, 219, 0.8),
    borderRadius: BorderRadius.circular(6),
    border: Border.all(
      color: const Color.fromRGBO(255, 83, 73, 1.0),
      width: 2,
    ),
    boxShadow: const [
      BoxShadow(
        blurRadius: 3,
        offset: Offset(3, 3),
        color: Color.fromRGBO(0, 0, 0, 0.2),
      ),
      BoxShadow(
        blurRadius: 3,
        offset: Offset(-3, -3),
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
    ]);

BoxDecoration selected_square_dark_neu_Morphism = BoxDecoration(

    // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
    borderRadius: BorderRadius.circular(6),
    color: Color.fromRGBO(25, 25, 25, 1.0),
    border: Border.all(
      color: const Color.fromRGBO(255, 83, 73, 1.0),
      width: 2,
    ),
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
