import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mybindel_test/screens/pricingPlans.dart';
import 'package:mybindel_test/screens/sendCodePage.dart';
import 'package:mybindel_test/widgets/creatorButton_widget.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../pagerouter/customPageRouter.dart';
import '../palette/palette.dart';
import '../widgets/fieldbutton_widget.dart';
import '../widgets/textformfield.dart';
// import '../widgets/rowbutton_widget.dart';
// import 'package:font_awesome_flutter/src/fa_icon.dart';

class login_page extends StatefulWidget {
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("Login called");
  }

  @override
  Widget build(BuildContext context) {
    final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme == Brightness.light
          ? light_Scaffold_color
          : dark_Scaffold_color,
      body: Column(children: [
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
          color: theme == Brightness.light
              ? light_Scaffold_color
              : dark_Scaffold_color,
          height: size.height * 0.43,
          width: size.width,
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                        fontFamily: 'Avant',
                        fontSize: 21,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(width: size.width * 0.010),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.010,
                      horizontal: size.width * 0.010),
                  child: textfields(
                    hintText: '  Email or phone',
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
                SizedBox(width: size.width * 0.010),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.010,
                      horizontal: size.width * 0.010),
                  child: textfields(
                    hintText: '  Password',
                    keybordType: TextInputType.emailAddress,
                    textController: _passwordController,
                    onChanged: (val) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                    validator: (val) {
                      if (val!.isEmpty || RegExp(r"\s").hasMatch(val)) {
                        return "Password must not be empty";
                      }
                    },
                    //icon: Icons.password,
                  ),
                ),
                SizedBox(width: size.width * 0.010),
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.010,
                        horizontal: size.width * 0.010),
                    child: fieldbutton(
                        title: "Continue",
                        height: size.height * 0.075,
                        width: size.width * 0.82,
                        onpressed: () {
                          Navigator.pushReplacement(context, custompageroute(child: PricingPlans()));
                          print(_emailcontroller.text);
                        })),
                SizedBox(height: size.height * 0.010),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgotten?',
                      style: TextStyle(
                          fontFamily: "Avant",
                          fontSize: 16,
                          // color: Color.fromRGBO(94, 94, 94, 1),
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    GestureDetector(
                      child: Text(
                        'Reset here!',
                        style: TextStyle(
                            fontFamily: 'Avant',
                            fontSize: 16,
                            color: orange_color,
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.push(
                              context, custompageroute(child: sendCode()));
                        }

                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        creatorButton(size),
      ]),
    );
  }
}
