import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/scheduler.dart';
import 'package:mybindel_test/pagerouter/customPageRouter.dart';
import 'package:mybindel_test/screens/payement_methodsPage.dart';
import 'package:mybindel_test/widgets/richText_pricingPlan.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../palette/palette.dart';
import '../providers/selectTheme.dart';
import '../widgets/fieldbutton_widget.dart';

class PricingPlans extends StatefulWidget {
  const PricingPlans({Key? key}) : super(key: key);

  @override
  State<PricingPlans> createState() => _PricingPlansState();
}

class _PricingPlansState extends State<PricingPlans> {
  // Future<bool?> getCurrentThemeInstance() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getBool('currentTheme');
  // }
  bool isPressed1 = true;
  bool isPressed2 = false;
  bool isPressed3 = false;
  @override
  Widget build(BuildContext context) {
    // final current_theme = getCurrentThemeInstance();
    final theme =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final provider = Provider.of<Themeprovider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  provider.currentTheme
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
                child: Image.asset("asset/images/logo.png"),
              ),
              SizedBox(width: size.width * 0.010),
              Container(
                height: size.height * 0.04,
                width: size.width * 0.27,
                alignment: Alignment.center,
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
            // color: Colors.green,
            width: size.width,
            height: size.height * 0.060,
            color:  provider.currentTheme
                ? light_Scaffold_color
                : dark_Scaffold_color,
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.087),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                "Pricing Plans",
                style: TextStyle(
                    fontFamily: 'Avant',
                    fontSize: 21,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color:  provider.currentTheme
                  ? light_Scaffold_color
                  : dark_Scaffold_color,
              child: ListView(
                // scrollDirection: Axis.vertical,
                // physics: NeverScrollableScrollPhysics(),
                // shrinkWrap: true,
                children: [
                  // 1 st
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isPressed1 = true;
                        isPressed2 = false;
                        isPressed3 = false;
                      });
                    },
                    child: AnimatedContainer(
                      padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      width: size.width * 0.60,
                      height: size.height * 0.18,
                      decoration:  provider.currentTheme
                          ? BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(240, 240, 240, 1),
                        boxShadow: [
                          BoxShadow(
                            inset: isPressed1,
                            blurRadius: isPressed1 ? 5 : 7,
                            offset:
                            isPressed1 ? Offset(3, 3) : Offset(7, 7),
                            color: Color.fromRGBO(184, 182, 182, 1.0),
                          ),
                          BoxShadow(
                            inset: isPressed1,
                            blurRadius: isPressed1 ? 2 : 7,
                            offset: isPressed1
                                ? Offset(-3, -3)
                                : Offset(-7, -7),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ],
                      )
                          : BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(25, 25, 25, 1.0),
                        boxShadow: [
                          BoxShadow(
                            inset: isPressed1,
                            blurRadius: isPressed1 ? 5 : 10,
                            offset: isPressed1
                                ? Offset(3, 3)
                                : Offset(10, 10),
                            color: Color.fromRGBO(18, 18, 18, 1.0),
                          ),
                          BoxShadow(
                            inset: isPressed1,
                            blurRadius: isPressed1 ? 4 : 3,
                            offset: isPressed1
                                ? Offset(-4, -4)
                                : Offset(-3, -3),
                            color: Color.fromRGBO(60, 60, 60, 1.0),
                          ),
                        ],
                      ),
                      duration: const Duration(microseconds: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Trial",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: orange_color,
                                  ),
                                ),
                                Text(
                                  "7days",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: orange_color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichTextPricingPlan(" 5Gb Storage Limit"),
                          RichTextPricingPlan(" Up-to 5 sharable links"),
                          RichTextPricingPlan(" Ads per link share"),
                          RichTextPricingPlan(" One device access."),
                        ],
                      ),
                    ),
                  ),
                  // 2 nd
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isPressed1 = false;
                        isPressed2 = true;
                        isPressed3 = false;
                      });

                    },
                    child: AnimatedContainer(
                      padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      width: size.width * 0.60,
                      height: size.height * 0.18,
                      decoration:  provider.currentTheme
                          ? BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(240, 240, 240, 1),
                        boxShadow: [
                          BoxShadow(
                            inset: isPressed2,
                            blurRadius: isPressed2 ? 5 : 7,
                            offset:
                            isPressed2 ? Offset(3, 3) : Offset(7, 7),
                            color: Color.fromRGBO(184, 182, 182, 1.0),
                          ),
                          BoxShadow(
                            inset: isPressed2,
                            blurRadius: isPressed2 ? 2 : 7,
                            offset: isPressed2
                                ? Offset(-3, -3)
                                : Offset(-7, -7),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ],
                      )
                          : BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(25, 25, 25, 1.0),
                        boxShadow: [
                          BoxShadow(
                            inset: isPressed2,
                            blurRadius: isPressed2 ? 10 : 5,
                            offset: isPressed2
                                ? Offset(10, 10)
                                : Offset(3, 3),
                            color: Color.fromRGBO(18, 18, 18, 1.0),
                          ),
                          BoxShadow(
                            inset: isPressed2,
                            blurRadius: isPressed2 ? 4 : 3,
                            offset: isPressed2
                                ? Offset(-4, -4)
                                : Offset(-3, -3),
                            color: Color.fromRGBO(60, 60, 60, 1.0),
                          ),
                        ],
                      ),
                      duration: const Duration(microseconds: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Lite",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: orange_color,
                                  ),
                                ),
                                Text(
                                  "\$10/M",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: orange_color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichTextPricingPlan(" 50Gb Storage Limit"),
                          RichTextPricingPlan(" Up-to 50 sharable links"),
                          RichTextPricingPlan(" Ads free experience"),
                          RichTextPricingPlan(
                              " Multiple devices at a same time"),
                        ],
                      ),
                    ),
                  ),
                  // 3 rd
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isPressed1 = false;
                        isPressed2 = false;
                        isPressed3 = true;
                      });
                    },
                    child: AnimatedContainer(
                      padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      width: size.width * 0.60,
                      height: size.height * 0.20,
                      decoration:  provider.currentTheme
                          ? BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(240, 240, 240, 1),
                        boxShadow: [
                          BoxShadow(
                            inset: isPressed3,
                            blurRadius: isPressed3 ? 5 : 7,
                            offset:
                            isPressed3 ? Offset(3, 3) : Offset(7, 7),
                            color: Color.fromRGBO(184, 182, 182, 1.0),
                          ),
                          BoxShadow(
                            inset: isPressed3,
                            blurRadius: isPressed3 ? 2 : 7,
                            offset: isPressed3
                                ? Offset(-3, -3)
                                : Offset(-7, -7),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ],
                      )
                          : BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(25, 25, 25, 1.0),
                        boxShadow: [
                          BoxShadow(
                            inset: isPressed3,
                            blurRadius: isPressed3 ? 10 : 5,
                            offset: isPressed3
                                ? Offset(10, 10)
                                : Offset(3, 3),
                            color: Color.fromRGBO(18, 18, 18, 1.0),
                          ),
                          BoxShadow(
                            inset: isPressed3,
                            blurRadius: isPressed3 ? 4 : 3,
                            offset: isPressed3
                                ? Offset(-4, -4)
                                : Offset(-3, -3),
                            color: Color.fromRGBO(60, 60, 60, 1.0),
                          ),
                        ],
                      ),
                      duration: const Duration(microseconds: 100),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Elite",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: orange_color,
                                  ),
                                ),
                                Text(
                                  "\$14.99/M",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: orange_color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichTextPricingPlan(" 500Gb Storage Limit"),
                          RichTextPricingPlan(" Unlimited sharable links"),
                          RichTextPricingPlan(" Ads free experience"),
                          RichTextPricingPlan(
                              " Multiple devices at a same time."),
                          RichTextPricingPlan(" Video call feature."),
                        ],
                      ),
                    ),
                  ),

                  // Container(
                  //   margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
                  //   child: Padding(
                  //       padding: EdgeInsets.symmetric(
                  //           vertical: size.height * 0.010,
                  //           horizontal: size.width * 0.010),
                  //       child: fieldbutton(
                  //           title: "Continue",
                  //           height: size.height * 0.075,
                  //           width: size.width * 0.82,
                  //           onpressed: () {
                  //             Navigator.push(context, custompageroute(child: PaymentMethods()));
                  //             print("Continue tapped");
                  //             print(isPressed1);
                  //             print(isPressed2);
                  //             print(isPressed3);
                  //           })),
                  // )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
            child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.010,
                    horizontal: size.width * 0.010),
                child: fieldbutton(
                    title: "Continue",
                    height: size.height * 0.075,
                    width: size.width * 0.82,
                    onpressed: () {
                      Navigator.push(context, custompageroute(child: PaymentMethods()));
                      print("Continue tapped");
                      print(isPressed1);
                      print(isPressed2);
                      print(isPressed3);
                    })),
          )
        ],
      ),
    );
  }
}