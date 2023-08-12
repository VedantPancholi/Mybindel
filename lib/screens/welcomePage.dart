import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mybindel_test/screens/DonationPage.dart';
import 'package:mybindel_test/screens/pricingPlans.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../pagerouter/customPageRouter.dart';
import '../palette/palette.dart';
import '../theme/selectTheme.dart';
import '../widgets/fieldbutton_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

//   Future<bool?> getCurrentThemeInstance() async{
//   SharedPreferences pref = await SharedPreferences.getInstance();
//   return pref.getBool('currentTheme');
// }
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    final theme =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final provider = Provider.of<Themeprovider>(context);
    // final current_theme = getCurrentThemeInstance();
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: provider.currentTheme
          ? light_Scaffold_color
          : dark_Scaffold_color,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: size.height * 0.15,
            width: size.width,
            color:  provider.currentTheme
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
            color:  provider.currentTheme
                ? light_Scaffold_color
                : dark_Scaffold_color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.380,
                  height: size.height * 0.200,
                  decoration:  provider.currentTheme
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
                          color:  provider.currentTheme
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
                          color:  provider.currentTheme
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
                  text:  provider.currentTheme ?"Would Like to Switch To Dark Mode?" : "Would Like to Switch To Light Mode?",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color:  provider.currentTheme
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
                  initialLabelIndex: selected,
                  cornerRadius: 10.0,
                  activeFgColor:  provider.currentTheme
                      ? light_Scaffold_color
                      : dark_Scaffold_color,
                  inactiveBgColor:  provider.currentTheme
                      ? dim_white
                      : dim_black,
                  inactiveFgColor:  provider.currentTheme
                      ? dim_black
                      : dim_white,
                  totalSwitches: 2,
                  labels: ['No', 'Yes'],
                  activeBgColor: [Colors.deepOrange.shade600],
                  // icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
                  // activeBgColors: [[orange_color],[Colors.pink]],
                  onToggle: (index) {
                    selected = index!;
                    provider.changeuserpref(index);
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
                    color:  provider.currentTheme
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

                    Navigator.pushReplacement(context, custompageroute(child: DonationPage()));
                    print("Continue from Welcome Page");
                  })),
        ],
      ),
    );
  }
}
