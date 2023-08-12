import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mybindel_test/pagerouter/customPageRouter.dart';
import 'package:mybindel_test/screens/Home/HomePage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../palette/palette.dart';
import '../theme/selectTheme.dart';


class DonationPage extends StatefulWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  // Future<bool?> getCurrentThemeInstance() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getBool('currentTheme');
  // }

  @override
  Widget build(BuildContext context) {
    // final current_theme = getCurrentThemeInstance();
    final theme =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final provider = Provider.of<Themeprovider>(context);

    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            height: size.height * 0.60,
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
                      image: AssetImage("asset/images/Large_Heart.png"),
                    ),
                  )
                      : BoxDecoration(
                    image: DecorationImage(
                      image:
                      AssetImage("asset/images/Dark_Large_Heart.png"),
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Ah ",
                        style: TextStyle(
                          fontSize: 18,
                          color:  provider.currentTheme
                              ? dark_Scaffold_color
                              : light_Scaffold_color,
                        ),
                      ),
                      TextSpan(
                        text: "John",
                        style: TextStyle(fontSize: 18, color: orange_color),
                      ),
                      TextSpan(
                        text: ",\nA homeless person is \n",
                        style: TextStyle(
                          fontSize: 18,
                          color:  provider.currentTheme
                              ? dark_Scaffold_color
                              : light_Scaffold_color,
                        ),
                      ),
                        TextSpan(
                        text: "awaiting your ",
                        style: TextStyle(
                          fontSize: 18,
                          color:  provider.currentTheme
                              ? dark_Scaffold_color
                              : light_Scaffold_color,
                        ),),
                      TextSpan(
                        text: "help!",
                          style: TextStyle(fontSize: 18, color: orange_color)),
                    ],
                  ),
                ),
              ],
            ),
          ),

         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
           Container(
             // color: Colors.amber,
             height: size.height * 0.055,
             width: size.width * 0.302,
             decoration:  provider.currentTheme?textFormField_neu_morphism:dark_textFormField_neu_morphism,
             child: TextFormField(
               keyboardType: TextInputType.numberWithOptions(decimal: true),
               decoration: InputDecoration(
                 contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 18.0),
                 border: InputBorder.none,
                 hintText: "Min. 10\$",
                 hintStyle: TextStyle(
                     fontSize: 14,
                     // fontFamily: 'Avant',
                     // color: Color.fromRGBO(94, 94, 94, 1),
                     letterSpacing: 1,
                     fontWeight: FontWeight.w400),
               ),
               onChanged: (val){
                 print(val);
               },
             )
           ),
           SizedBox(width: size.width*0.040,),
           Container(

             // color: Colors.green,
             height: size.height * 0.055,
             width: size.width * 0.502,
             decoration:  provider.currentTheme?neu_Morphism : dark_neu_Morphism,
             child: InkWell(
               onTap: (){
                 //payment gateway
                 print("Donate Now");
               },
               child: Center(
                   child: Text(
                     "Donate Now!",
                     style: TextStyle(
                         color: orange_color,
                         fontSize: 16,
                         // fontFamily: 'Avant',
                         fontWeight: FontWeight.w600,
                         letterSpacing: 1,
                         height: 0.7),
                   )),
             ),
           ),
           ],
         ),
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height*0.030),
            // color: Colors.green,
            height: size.height * 0.060,
            width: size.width * 0.802,
            decoration:  provider.currentTheme?neu_Morphism : dark_neu_Morphism,
            child: InkWell(
              onTap: (){
                Navigator.push(context, custompageroute(child: HomePage()));
                print("Maybe Later... pressed");
              },
              child: Center(
                  child: Text(
                    "Maybe Later...",
                    style: TextStyle(
                        color:  provider.currentTheme
                            ? dim_black
                            : dim_white,
                        fontSize: 18,
                        // fontFamily: 'Avant',
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        height: 0.7,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
