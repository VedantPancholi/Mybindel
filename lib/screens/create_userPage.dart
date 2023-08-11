import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:mybindel_test/screens/welcomePage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import '../pagerouter/customPageRouter.dart';
import '../palette/palette.dart';
import '../widgets/fieldbutton_widget.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _fname = TextEditingController();
  TextEditingController _lname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _confirmPass = TextEditingController();
  TextEditingController _purpose = TextEditingController();

  final Uri _url = Uri.parse('https://www.google.com/');
  bool isPressed1 = false;


  @override
  Widget build(BuildContext context) {
    final theme =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme == Brightness.light
          ? light_Scaffold_color
          : dark_Scaffold_color,
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
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
          ListView(
            shrinkWrap: true,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.087),
                color: theme == Brightness.light
                    ? light_Scaffold_color
                    : dark_Scaffold_color,
                // color: Colors.amber,
                height: size.height*0.79,
                width: size.width,
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Create User",
                          style: TextStyle(
                              fontFamily: 'Avant',
                              fontSize: 21,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(width: size.width * 0.010),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                  height: size.height * 0.060,
                                  width: size.width * 0.402,
                                  decoration: theme == Brightness.light
                                      ? textFormField_neu_morphism
                                      : dark_textFormField_neu_morphism,
                                  child: f_nameTextfields(_fname, size))),
                          SizedBox(
                            width: size.width * 0.050,
                          ),
                          Expanded(
                              child: Container(
                                  height: size.height * 0.060,
                                  width: size.width * 0.402,
                                  decoration: theme == Brightness.light
                                      ? textFormField_neu_morphism
                                      : dark_textFormField_neu_morphism,
                                  child: l_nameTextfields(_lname, size))),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      Container(
                        height: size.height * 0.055,
                        width: size.width * 0.852,
                        decoration: theme == Brightness.light
                            ? textFormField_neu_morphism
                            : dark_textFormField_neu_morphism,
                        child: e_mailTextfields3(_email, size),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      Container(
                        height: size.height * 0.055,
                        width: size.width * 0.852,
                        decoration: theme == Brightness.light
                            ? textFormField_neu_morphism
                            : dark_textFormField_neu_morphism,
                        child: c_noTextfields4(_contact, size),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      Container(
                        height: size.height * 0.055,
                        width: size.width * 0.852,
                        decoration: theme == Brightness.light
                            ? textFormField_neu_morphism
                            : dark_textFormField_neu_morphism,
                        child: addressTextfields(_address, size),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      Container(
                        height: size.height * 0.055,
                        width: size.width * 0.852,
                        decoration: theme == Brightness.light
                            ? textFormField_neu_morphism
                            : dark_textFormField_neu_morphism,
                        child: TextFormField(
                          controller: _pass,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: size.height * 0.010,
                                horizontal: size.width * 0.020),
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                            hintText: "Password",
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (val) {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                RegExp(r"\s").hasMatch(value)) {
                              return "Enter correct Password";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      Container(
                        height: size.height * 0.055,
                        width: size.width * 0.852,
                        decoration: theme == Brightness.light
                            ? textFormField_neu_morphism
                            : dark_textFormField_neu_morphism,
                        child: TextFormField(
                          controller: _confirmPass,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: size.height * 0.010,
                                horizontal: size.width * 0.020),
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                            hintText: "Confirm Password",
                          ),
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (val) {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                            }
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                RegExp(r"\s").hasMatch(value)) {
                              return "Enter correct Password";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      //dropdown search
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.020),
                        decoration: theme == Brightness.light
                            ? textFormField_neu_morphism
                            : dark_textFormField_neu_morphism,
                        child: DropdownSearch<String>(
                          popupProps: PopupProps.menu(
                            showSearchBox: true,
                            showSelectedItems: true,
                            disabledItemFn: (String s) => s.startsWith('I'),
                          ),
                          items: [
                            "Purpose 1",
                            "Purpose 2",
                            "Purpose 3",
                            "Purpose 4"
                          ],
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              border: InputBorder.none,
                              // labelText: "Purpose",
                              hintText: "Purpose",
                            ),
                          ),
                          onChanged: print,
                          // selectedItem: "Brazil",
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      Row(
                        children: [
                          Container(
                            width: size.width * 0.095,
                            height: size.height * 0.040,
                            decoration: theme == Brightness.light
                                ? textFormField_neu_morphism
                                : dark_textFormField_neu_morphism,
                            child: IconButton(
                              color: theme == Brightness.light
                                  ? light_Scaffold_color
                                  : dark_Scaffold_color,
                              onPressed: () {
                                setState(() {
                                  isPressed1 = true;
                                });
                              },
                              icon: Icon(
                                Icons.check,
                                color: isPressed1 == true
                                    ? orange_color
                                    : dim_white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.030,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                              text: TextSpan(children: [
                            TextSpan(
                              text: "I agreed to the ",
                              style: TextStyle(
                                  color: theme == Brightness.light
                                      ? dim_black
                                      : dim_white),
                            ),
                            TextSpan(
                              text: "Terms and Conditions",
                              style: TextStyle(color: orange_color),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launchUrl(_url);
                                },
                            )
                          ]))
                        ],
                      ),
                      Container(
                          height: size.height*0.15,
                          // color: Colors.blue,//margin: EdgeInsets.fromLTRB(0,0,0,size.height*0.050),
                          child: Center(
                            child: fieldbutton(
                                title: "Continue",
                                padding:EdgeInsets.symmetric(
                                    vertical: size.height * 0.010,
                                    horizontal: size.width * 0.010),
                                height: size.height * 0.075,
                                width: size.width * 0.82,
                                onpressed: () {
                                  setState(() {
                                    isPressed1 = false;
                                  });
                                  // Navigator.pushReplacement(context, custompageroute(child: WelcomePage()));
                                  // print(_emailcontroller.text);
                                }),
                          )

                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

Widget f_nameTextfields(TextEditingController _fname, Size size) =>
    TextFormField(
      controller: _fname,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.010, horizontal: size.width * 0.020),
        hintStyle: const TextStyle(
            fontSize: 14,
            // fontFamily: 'Avant',
            // color: Color.fromRGBO(94, 94, 94, 1),
            letterSpacing: 1,
            fontWeight: FontWeight.w500),
        hintText: "First Name",
      ),
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[A-z a-z]+$').hasMatch(value)) {
          return "Enter correct name";
        } else {
          return null;
        }
      },
    );
Widget l_nameTextfields(TextEditingController _lname, Size size) =>
    TextFormField(
        controller: _lname,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              vertical: size.height * 0.010, horizontal: size.width * 0.020),
          hintStyle: const TextStyle(
              fontSize: 14, letterSpacing: 1, fontWeight: FontWeight.w500),
          hintText: "Last Name",
        ),
        textInputAction: TextInputAction.next,
        validator: (value) {
          if (value!.isEmpty || !RegExp(r'^[A-z a-z]+$').hasMatch(value)) {
            return "Enter correct name";
          } else {
            return null;
          }
        });

Widget e_mailTextfields3(TextEditingController _email, Size size) =>
    TextFormField(
      controller: _email,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.010, horizontal: size.width * 0.020),
        hintStyle: const TextStyle(
            fontSize: 14, letterSpacing: 1, fontWeight: FontWeight.w500),
        hintText: "Email address",
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,5}$').hasMatch(value)) {
          return "Enter correct e-mail";
        } else {
          return null;
        }
      },
    );
Widget c_noTextfields4(TextEditingController _contact, Size size) => TextFormField(
      controller: _contact,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.010, horizontal: size.width * 0.020),
        hintStyle: const TextStyle(
            fontSize: 14, letterSpacing: 1, fontWeight: FontWeight.w500),
        hintText: "Phone Number",
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
          RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
          return "Enter correct number";
        } else {
          return null;
        }
      },
    );
Widget addressTextfields(TextEditingController _address, Size size) => TextFormField(
      controller: _address,
      maxLines: 2,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.010, horizontal: size.width * 0.020),
        hintStyle: const TextStyle(
            fontSize: 14,
            // fontFamily: 'Avant',
            // color: Color.fromRGBO(94, 94, 94, 1),
            letterSpacing: 1,
            fontWeight: FontWeight.w500),
        hintText: "Address",
      ),
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return "Address must not be Empty";
        } else {
          return null;
        }
      },
    );
// Widget passwordTextfields5( TextEditingController _pass, Size size, _formkey) => TextFormField(
//   controller: _pass,
//   decoration: InputDecoration(
//     contentPadding: EdgeInsets.symmetric(vertical: size.height*0.010, horizontal: size.width*0.020),
//     hintStyle: const TextStyle(
//         fontSize: 14,
//         letterSpacing: 1,
//         fontWeight: FontWeight.w500),
//     hintText: "Password",
//   ),
//   keyboardType: TextInputType.text,
//   textInputAction: TextInputAction.next,
//   autovalidateMode: AutovalidateMode.onUserInteraction,
//   validator: (value) {
//     if (value!.isEmpty || RegExp(r"\s").hasMatch(value)) {
//       return "Enter correct Password";
//     } else {
//       return null;
//     }
//   },
// );
// Widget confirmPasswordTextfields( TextEditingController _confirmPass, Size size) => TextFormField(
//   controller: _confirmPass,
//   decoration: InputDecoration(
//     contentPadding: EdgeInsets.symmetric(vertical: size.height*0.010, horizontal: size.width*0.020),
//     hintStyle: const TextStyle(
//         fontSize: 14,
//         letterSpacing: 1,
//         fontWeight: FontWeight.w500),
//     hintText: "Confirm Password",
//   ),
//   keyboardType: TextInputType.text,
//   textInputAction: TextInputAction.next,
//   autovalidateMode: AutovalidateMode.onUserInteraction,
//   validator: (value) {
//     if (value!.isEmpty || RegExp(r"\s").hasMatch(value)) {
//       return "Enter correct Password";
//     } else {
//       return null;
//     }
//   },
// );
