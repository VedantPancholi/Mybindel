import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../palette/palette.dart';

class RichTextPricingPlan extends StatefulWidget {
   String text;


   RichTextPricingPlan(
       this.text,
       );

  @override
  State<RichTextPricingPlan> createState() => _RichTextPricingPlanState();
}

class _RichTextPricingPlanState extends State<RichTextPricingPlan> {
  @override
  Widget build(BuildContext context) {
    final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;

    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(Icons.check, size: 15,color: orange_color,),
          ),
          TextSpan(
            text: widget.text,
            style: TextStyle(fontSize: 18,color: theme == Brightness.light
              ? dark_Scaffold_color
              : light_Scaffold_color,),
          ),
        ],
      ),
    );
  }
}
