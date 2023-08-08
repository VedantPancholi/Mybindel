import 'package:flutter/material.dart';
import 'package:mybindel_test/pagerouter/customPageRouter.dart';
import 'package:mybindel_test/screens/password_reset.dart';

import '../palette/palette.dart';
import '../widgets/creatorButton_widget.dart';
import '../widgets/fieldbutton_widget.dart';
import '../widgets/textformfield.dart';


class enterCode extends StatefulWidget {
  @override
  State<enterCode> createState() => _enterCodeState();
}

class _enterCodeState extends State<enterCode> {
  TextEditingController _emailcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String description =
        "Check your mailbox or phone for the code. The code lasts for only 5 minutes right after it is sent to you.";

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              child: Text("Mybindle",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 22,letterSpacing: 1.5),),),
          ]),
        ),
        Container(
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
                        color: theme == Brightness.light ? const Color.fromRGBO(51, 51, 51, 1) : Colors.grey.shade100,
                        // fontFamily: 'Avant',
                        fontSize: 19,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: size.height * 0.010),
                Container(
                  height: size.height * 0.093,
                  width: size.width * 0.83,
                  // color: Colors.amber,
                  child: Row(children: [
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          description,
                          //  textAlign: TextAlign.justify,

                          style: TextStyle(
                              // fontFamily: 'Avant',
                              fontSize: 14,
                              letterSpacing: 1,
                              color: theme == Brightness.light ? const Color.fromRGBO(91, 91, 91, 1) : Colors.grey.shade100,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(width: size.width * 0.018),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.010,
                      horizontal: size.width * 0.010),
                  child: textfields(
                    hintText: 'Enter your code here',
                    maxlength: 6,
                    keybordType: TextInputType.number,
                    textController: _emailcontroller,
                    //icon: Icons.password,
                  ),
                ),
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
                          Navigator.push(context, custompageroute(child: PasswordReset()));
                          print(_emailcontroller.text);
                        })),
                SizedBox(height: size.height * 0.010),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Didn’t get the code? ',
                      style: TextStyle(
                          fontFamily: 'Avant',
                          fontSize: 16,
                          color: theme == Brightness.light ? const Color.fromRGBO(94, 94, 94, 1) : Colors.grey.shade100,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    GestureDetector(
                      child: Text(
                        'Resend',
                        style: TextStyle(
                            fontFamily: 'Avant',
                            fontSize: 16,
                            color: Color.fromRGBO(255, 83, 73, 1),
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
