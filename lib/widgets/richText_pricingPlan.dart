import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../palette/palette.dart';
import '../providers/selectTheme.dart';

class RichTextPricingPlan extends StatefulWidget {
   String text;


   RichTextPricingPlan(
       this.text,
       );

  @override
  State<RichTextPricingPlan> createState() => _RichTextPricingPlanState();
}

class _RichTextPricingPlanState extends State<RichTextPricingPlan> {
  // Future<bool?> getCurrentThemeInstance() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getBool('currentTheme');
  // }
  @override
  Widget build(BuildContext context) {
    // final current_theme = getCurrentThemeInstance();
    final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final provider = Provider.of<Themeprovider>(context);

    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Icon(Icons.check, size: 15,color: orange_color,),
          ),
          TextSpan(
            text: widget.text,
            style: TextStyle(fontSize: 18,color:  provider.currentTheme
              ? dark_Scaffold_color
              : light_Scaffold_color,),
          ),
        ],
      ),
    );
  }
}
