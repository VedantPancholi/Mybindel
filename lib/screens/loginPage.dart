import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../palette/palette.dart';
import '../widgets/fieldbutton_widget.dart';
import '../widgets/rowbutton_widget.dart';
import '../widgets/textformfield.dart';
// import 'package:font_awesome_flutter/src/fa_icon.dart';

class login_page extends StatefulWidget {
  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = MediaQuery.of(context).platformBrightness;

    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
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
          // color: Color(0xffff0707),
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
                        print(_emailcontroller.text);
                      })),
              SizedBox(height: size.height * 0.010),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgotten?',
                    style: TextStyle(
                        fontFamily: 'Avant',
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
                    onTap: () {},
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: size.width,
            // color: Colors.green,
            color: theme == Brightness.light
                ? light_Scaffold_color
                : dark_Scaffold_color,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.020,
                        horizontal: size.width * 0.050),
                    child: Text(
                      "Don’t have one?",
                      style: TextStyle(
                          fontFamily: 'Avant',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          // color: Color.fromRGBO(51, 51, 51, 1),
                          letterSpacing: 1),
                    )),
                rowbutton(
                  title: 'Create using E-mail',
                  icon: Icons.alternate_email,
                  onpressed: () {
                    print("ok");
                  },
                  margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.005,
                      horizontal: size.width * 0.087),
                  iconHeight: size.height * 0.07,
                  iconWidth: size.width * 0.14,
                  width: size.width * 0.60,
                ),
                rowbutton(
                  title: 'Create using Phone',
                  icon: Icons.phone,
                  onpressed: () {
                    print("ok");
                  },
                  margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.005,
                      horizontal: size.width * 0.087),
                  iconHeight: size.height * 0.07,
                  iconWidth: size.width * 0.14,
                  width: size.width * 0.60,
                ),
                rowbutton(
                  title: 'Continue with Google',
                  icon: Icons.search_rounded,
                  // FaIcon(FontAwesomeIcons.google),
                  onpressed: () {
                    print("ok");
                  },
                  margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.005,
                      horizontal: size.width * 0.087),
                  iconHeight: size.height * 0.07,
                  iconWidth: size.width * 0.14,
                  width: size.width * 0.60,
                ),
                rowbutton(
                  title: 'Continue with Apple',
                  icon: Icons.apple,
                  onpressed: () {
                    print("ok");
                  },
                  margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.005,
                      horizontal: size.width * 0.087),
                  iconHeight: size.height * 0.07,
                  iconWidth: size.width * 0.14,
                  width: size.width * 0.60,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
