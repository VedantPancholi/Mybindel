import 'package:flutter/material.dart';

class custompageroute extends PageRouteBuilder {
  final Widget child;

  custompageroute({required this.child})
      : super(
      transitionDuration: Duration(milliseconds: 400),
      pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) =>
      FadeTransition(opacity: animation, child: child);
}
