import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../palette/palette.dart';
import '../widgets/fieldbutton_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final theme =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: theme == Brightness.light
          ? light_Scaffold_color
          : dark_Scaffold_color,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: size.height * 0.15,
            width: size.width,
            color: theme == Brightness.light
                ? light_Scaffold_color
                : dark_Scaffold_color,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  height: size.height * 0.04,
                  width: size.width * 0.076,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('asset/images/logo.png')))),
              SizedBox(width: size.width * 0.010),
              Container(
                height: size.height * 0.04,
                width: size.width * 0.27,
                alignment: Alignment.center,
                decoration: BoxDecoration(),
                child: Text(
                  "Mybindle",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      letterSpacing: 1.5),
                ),
              ),
            ]),
          ),
          Container(
            height: size.height * 0.50,
            width: size.width,
            color: theme == Brightness.light
                ? light_Scaffold_color
                : dark_Scaffold_color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.380,
                  height: size.height * 0.200,
                  decoration: theme == Brightness.light
                      ? BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("asset/images/Large_Check.png"),
                          ),
                        )
                      : BoxDecoration(
                          image: DecorationImage(
                            image:
                                AssetImage("asset/images/Dark_Large_Check.png"),
                          ),
                        ),
                ),
                // Image.asset("asset/images/Large_Check.png",width: size.width*0.380, height: size.height * 0.200,),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Hi ",
                        style: TextStyle(
                          fontSize: 18,
                          color: theme == Brightness.light
                              ? dark_Scaffold_color
                              : light_Scaffold_color,
                        ),
                      ),
                      TextSpan(
                        text: "John. \n",
                        style: TextStyle(fontSize: 18, color: orange_color),
                      ),
                      TextSpan(
                        text: "Your Bindle Is Ready!",
                        style: TextStyle(
                          fontSize: 18,
                          color: theme == Brightness.light
                              ? dark_Scaffold_color
                              : light_Scaffold_color,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.020),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "But, Would Like to Switch To Dark Mode?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: theme == Brightness.light
                        ? dark_Scaffold_color
                        : light_Scaffold_color,
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ToggleSwitch(
                  animationDuration: 800,
                  minWidth: size.width * 0.140,
                  minHeight: size.height * 0.040,
                  initialLabelIndex: 0,
                  cornerRadius: 10.0,
                  activeFgColor: theme == Brightness.light
                      ? light_Scaffold_color
                      : dark_Scaffold_color,
                  inactiveBgColor: theme == Brightness.light
                      ? dim_white
                      : dim_black,
                  inactiveFgColor: theme == Brightness.light
                      ? dim_black
                      : dim_white,
                  totalSwitches: 2,
                  labels: ['No', 'Yes'],
                  activeBgColor: [Colors.deepOrange.shade600],
                  // icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
                  // activeBgColors: [[orange_color],[Colors.pink]],
                  onToggle: (index) {
                    print('switched to: $index');
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: size.height * 0.020),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Well, you can change later in the settings too.",
                  style: TextStyle(
                    fontSize: 16,
                    color: theme == Brightness.light
                        ? dark_Scaffold_color
                        : light_Scaffold_color,
                  ),
                )),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.010,
                  horizontal: size.width * 0.010),
              child: fieldbutton(
                  title: "Continue",
                  height: size.height * 0.075,
                  width: size.width * 0.82,
                  onpressed: () {
                    // Navigator.pushReplacement(context, custompageroute(child: PricingPlans()));
                    print("Continue from Welcome Page");
                  })),
        ],
      ),
    );
  }
}
