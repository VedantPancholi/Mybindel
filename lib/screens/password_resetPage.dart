import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:mybindel_test/screens/loginPage.dart';
import '../pagerouter/customPageRouter.dart';
import '../palette/palette.dart';
import '../widgets/fieldbutton_widget.dart';
import '../widgets/textformfield.dart';

class PasswordReset extends StatefulWidget {
  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  TextEditingController _newpasswordcontroller = TextEditingController();
  TextEditingController _confirmedpasswordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final size = MediaQuery.of(context).size;
    String mustfollow =
        "Include at least 8 character along with alphabets, numbers and symbols.";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme == Brightness.light
          ? light_Scaffold_color
          : dark_Scaffold_color,
      body: Column(
          children: [
        Container(
          alignment: Alignment.center,
          height: size.height * 0.12,
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
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.087),
            color: theme == Brightness.light
                ? light_Scaffold_color
                : dark_Scaffold_color,
            height: size.height * 0.43,
            width: size.width,
            // color: Color(0xffff0707),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Password Recovery",
                      style: TextStyle(
                          color: theme == Brightness.light
                              ? dim_black
                              : dim_white,
                          // fontFamily: 'Avant',
                          fontSize: 19,
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
                      hintText: 'Enter new password',
                      keybordType: TextInputType.emailAddress,
                      textController: _newpasswordcontroller,
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
                    child: textfields(
                      hintText: 'Confirm new password',
                      keybordType: TextInputType.emailAddress,
                      textController: _confirmedpasswordcontroller,
                      onChanged: (val) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Password must not be empty";
                        }
                        if (val != _newpasswordcontroller.text) {
                          return "Password Not match";
                        }
                        return null;
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
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            }
                            print(_newpasswordcontroller.text);
                            print(_confirmedpasswordcontroller.text);
                            Navigator.pushAndRemoveUntil(
                                context,
                                custompageroute(child: login_page()),
                                (route) => false);
                          })),
                  SizedBox(width: size.width * 0.010),
                  Container(
                    height: size.height * 0.083,
                    width: size.width * 0.83,
                    // color: Colors.amber,
                    child: Row(children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Text(
                            mustfollow,
                            //  textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontFamily: 'Avant',
                                fontSize: 12,
                                letterSpacing: 1,
                                color: Color.fromRGBO(94, 94, 94, 1),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
