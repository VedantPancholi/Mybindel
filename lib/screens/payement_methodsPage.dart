import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../palette/palette.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  @override
  Widget build(BuildContext context) {
    final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
            height: size.height * 0.85,
            width: size.width,
            // color: Colors.amber,
            color: theme == Brightness.light
                ? light_Scaffold_color
                : dark_Scaffold_color,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.087,),
                    height: size.height * 0.028,
                    width: size.width,
                  color: Colors.green,
                  child: const Text(
                    "Payment Methods",
                    style: TextStyle(
                        fontFamily: 'Avant',
                        fontSize: 21,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          // color: Colors.deepOrange,
                          // width: 20,
                          // height: 20,
                          width: size.width*0.058,
                          height: size.height*0.028,
                          // decoration: theme == Brightness.light?neu_Morphism : dark_neu_Morphism,
                          child: Image.asset("asset/images/PayPal.png"),
                        ),
                        SizedBox(width: size.width*0.010,),
                        Container(
                          color: Colors.green,
                          // width: 20,
                          // height: 20,
                          width: size.width*0.68,
                          height: size.height*0.028,
                        ),
                      ],
                    ),
                  ]
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
