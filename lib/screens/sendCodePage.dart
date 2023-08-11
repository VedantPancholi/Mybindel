import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../pagerouter/customPageRouter.dart';
import '../palette/palette.dart';
import '../widgets/creatorButton_widget.dart';
import '../widgets/fieldbutton_widget.dart';
import '../widgets/textformfield.dart';
import 'EnterCodePage.dart';


class sendCode extends StatefulWidget {
  @override
  State<sendCode> createState() => _sendCodeState();
}

class _sendCodeState extends State<sendCode> {
  // Future<bool?> getCurrentThemeInstance() async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   return pref.getBool('currentTheme');
  // }
  TextEditingController _emailcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final current_theme = getCurrentThemeInstance();
    final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        Container(
          alignment: Alignment.center,
          height: size.height * 0.15,
          width: size.width,
          color:  theme == Brightness.light
              ? light_Scaffold_color
              : dark_Scaffold_color,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                height: size.height * 0.04,
                width: size.width * 0.076,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image:
                    DecorationImage(image: AssetImage('asset/images/logo.png')))),
            SizedBox(width: size.width * 0.010),
            Container(
                height: size.height * 0.04,
                width: size.width * 0.27,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage('asset/images/mainTitle.png'
                  //       ''),
                  // ),
                ),
                child: Text("Mybindle",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,letterSpacing: 1.5),),
            ),
          ]),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.087),
          color:  theme == Brightness.light
              ? light_Scaffold_color
              : dark_Scaffold_color,
          height: size.height * 0.43,
          width: size.width,
          //  color: Color(0xffff0707),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:  Text(
                    "Password Recovery",
                    style: TextStyle(
                        color:  theme == Brightness.light ?  Color.fromRGBO(51, 51, 51, 1) : Colors.grey.shade100,
                        // fontFamily: 'Avant',
                        fontSize: 19,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: size.height * 0.018),
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.010,
                        horizontal: size.width * 0.010),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        decoration:  theme == Brightness.light?neu_Morphism : dark_neu_Morphism,
                        // BoxDecoration(
                        //     border: Border.all(
                        //         width: 1, color: Color.fromRGBO(94, 94, 94, 1)),
                        //     borderRadius: BorderRadius.circular(7)),
                        height: size.height * 0.055,
                        width: size.width * 0.48,
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.arrow_back),
                            Text(
                              "Back to Login",
                              style: TextStyle(
                                  color:  theme == Brightness.light ?  Color.fromRGBO(51, 51, 51, 1) : Colors.grey.shade300,
                                  // fontFamily: 'Avant',
                                  fontSize: 16,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    )),
                SizedBox(height: size.height * 0.012),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.010,
                      horizontal: size.width * 0.012),
                  child: textfields(
                    hintText: 'Email or phone',
                    keybordType: TextInputType.emailAddress,
                    textController: _emailcontroller,
                    onChanged: (val) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                    validator: (val) {
                      if (val!.isEmpty || RegExp(r"\s").hasMatch(val)) {
                        return "Email must not be empty";
                      } else {
                        if (RegExp(
                            r"^[a-zA-Z0-9]+[^#$%&*]+[a-zA-Z0-9]+@[a-z]+\.[a-z]{2,3}")
                            .hasMatch(val)) {
                          return null;
                        } else {
                          return "Enter a valid Email";
                        }
                      }
                    },
                    //icon: Icons.password,
                  ),
                ),
                SizedBox(height: size.height * 0.012),
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.010,
                        horizontal: size.width * 0.010),
                    child: fieldbutton(
                        title: "Send Code",
                        height: size.height * 0.075,
                        width: size.width * 0.82,
                        onpressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Navigator.push(
                                context, custompageroute(child: enterCode()));
                          }
                          print(_emailcontroller.text);

                        })),
                SizedBox(height: size.height*0.012,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Remembered?',
                      style: TextStyle(
                          // fontFamily: 'Avant',
                          fontSize: 16,
                          color:  theme == Brightness.light ?  Color.fromRGBO(91, 91, 91, 1) : Colors.grey.shade100,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    GestureDetector(
                      child: Text(
                        'Login here!',
                        style: TextStyle(
                            // fontFamily: 'Avant',
                            fontSize: 16,
                            color: orange_color,
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () {},
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        creatorButton(size)
      ]),
    );
  }
}
