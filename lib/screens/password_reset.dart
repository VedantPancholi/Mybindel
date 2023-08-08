import 'package:flutter/material.dart';

import '../pagerouter/customPageRouter.dart';
import '../palette/palette.dart';
import '../widgets/fieldbutton_widget.dart';
import '../widgets/textformfield.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  String mustFollow = "Include at least 8 character along with alphabets, numbers and symbols.";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.087),
              color: theme == Brightness.light
                  ? light_Scaffold_color
                  : dark_Scaffold_color,
              height: size.height,
              width: size.width,
              // color: Color(0xffff0707),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Password Recovery",
                      style: TextStyle(
                          color: theme == Brightness.light ? const Color.fromRGBO(51, 51, 51, 1) : Colors.grey.shade100,
                          // fontFamily: 'Avant',
                          fontSize: 19,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: size.height * 0.010),




                  // change here for confirming password



                  //
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       vertical: size.height * 0.010,
                  //       horizontal: size.width * 0.010),
                  //   child: textfields(
                  //     hintText: 'Enter new password',
                  //     keybordType: TextInputType.emailAddress,
                  //     textController: ,
                  //     //icon: Icons.password,
                  //   ),
                  // ),
                  // SizedBox(height: size.height * 0.010),Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       vertical: size.height * 0.010,
                  //       horizontal: size.width * 0.010),
                  //   child: textfields(
                  //     hintText: 'Confirm new password',
                  //     keybordType: TextInputType.emailAddress,
                  //     textController: ,
                  //     //icon: Icons.password,
                  //   ),
                  // ),






                  SizedBox(height: size.height * 0.010),
                  Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.010,
                          horizontal: size.width * 0.010),
                      child: fieldbutton(
                          title: "Continue",
                          height: size.height * 0.075,
                          width: size.width * 0.82,
                          onpressed: () {
                            print("");
                          })),
                  SizedBox(height: size.height * 0.010),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
                    child: Text(mustFollow,style: TextStyle(
                      // fontFamily: 'Avant',
                        fontSize: 15,
                        color: theme == Brightness.light ? const Color.fromRGBO(91, 91, 91, 1) : Colors.grey.shade300,
                        fontWeight: FontWeight.w400),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
