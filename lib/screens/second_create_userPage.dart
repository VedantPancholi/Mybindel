import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:mybindel_test/screens/create_userPage.dart';
import 'package:mybindel_test/screens/pricingPlans.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../pagerouter/customPageRouter.dart';
import '../palette/palette.dart';
import '../providers/selectTheme.dart';
import 'package:intl/intl.dart';

import '../widgets/fieldbutton_widget.dart';

class SecondCreateUserPage extends StatefulWidget {

String sendToEmail;
SecondCreateUserPage(this.sendToEmail);

  @override
  State<SecondCreateUserPage> createState() => _SecondCreateUserPageState();
}

class _SecondCreateUserPageState extends State<SecondCreateUserPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _verify = TextEditingController();
  TextEditingController _date = TextEditingController();

  final Uri _url = Uri.parse('https://www.google.com/');
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final size = MediaQuery.of(context).size;
    final theme =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return Scaffold(
    resizeToAvoidBottomInset: false,
    backgroundColor:
    provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: size.height * 0.15,
                width: size.width,
                // color: Colors.amber,
                color: provider.currentTheme
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
                    // width: size.width * 0.27,
                    alignment: Alignment.center,
                    // color: Colors.amber,
                    child: Text(
                      "Mybindle",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.087),
                color: provider.currentTheme
                ? light_Scaffold_color
                : dark_Scaffold_color,
                height: size.height * 0.20,
                width: size.width,
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                InkWell(
                  onTap: (){
                    Navigator.pushAndRemoveUntil(context, custompageroute(child: CreateUser()), (route) => false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: size.width*0.060,
                        height: size.height*0.030,
                          decoration : provider.currentTheme
                              ? const BoxDecoration(
                              // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                              color: Color.fromRGBO(240, 240, 240, 1),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  offset: Offset(1, 1),
                                  color: Color.fromRGBO(174, 172, 172, 1.0),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-3, -4),
                                  color: Color.fromRGBO(255, 255, 255, 1.0),
                                ),
                              ])
                              : const BoxDecoration(
                              // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                              color: Color.fromRGBO(25, 25, 25, 1.0),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  offset: Offset(5, 5),
                                  color: Color.fromRGBO(18, 18, 18, 1.0),
                                ),
                                BoxShadow(
                                  blurRadius: 3,
                                  offset: Offset(-3, -5),
                                  color: Color.fromRGBO(33, 33, 33, 1.0),
                                ),
                              ]),
                          child: Center(child: Icon(Icons.arrow_back_ios_rounded,color: orange_color,size: 17,))),
                      SizedBox(width: size.width*0.020,),
                       Text(
                        "Create New",
                        style: TextStyle(
                          color: provider.currentTheme ? dim_black : dim_white,
                            fontFamily: 'Avant',
                            fontSize: 21,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.020),
                Container(
                  decoration:  provider.currentTheme?textFormField_neu_morphism:dark_textFormField_neu_morphism,
                  child: TextFormField(
                      inputFormatters:  [FilteringTextInputFormatter.digitsOnly],
                      maxLength: 6,
                      controller: _verify,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0),
                        border: InputBorder.none,
                        hintText: "Enter your verification code",
                        hintStyle: TextStyle(
                            fontSize: 14,
                            // fontFamily: 'Avant',
                            // color: Color.fromRGBO(94, 94, 94, 1),
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500),
                      ),
                      // keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      onChanged: null,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width*0.60,
                      child: AutoSizeText(
                        
                        "The code was sent to ${widget.sendToEmail}",
                        softWrap: true,
                        wrapWords: true,
                        style: TextStyle(color: provider.currentTheme ? dim_black : dim_white),
                      ),
                    ),
                    TextButton(onPressed: (){}, child: Text("Resend",style: TextStyle(color: orange_color),))
                  ],
                ),
                // SizedBox(height: size.height * 0.020),

                ],
              ),
              ),
              Container(
                width: size.width,
                height: size.height*0.30,
                // color: Colors.amber,
                color: provider.currentTheme
                    ? light_Scaffold_color
                    : dark_Scaffold_color,
                child: Stack(
                  children: [
                    Align(
                      alignment : Alignment.topCenter,
                      child: InkWell(
                        splashColor: orange_color,
                        // highlightColor: Colors.black,
                        onTap: (){
                          print("cover photo");
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: size.height*0.01),
                          width: size.width*90,
                          height: size.height*0.18,
                          // color: Colors.deepOrange,
                          decoration: provider.currentTheme
                              ? neu_Morphism
                              : dark_neu_Morphism,
                          child: Center(
                            child: Padding(
                              padding:  EdgeInsets.only(bottom: size.height*0.012),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(Icons.add, size: 35,color: orange_color,),
                                    ),
                                    TextSpan(
                                      text: "\nUpload Cover Photo",
                                      style: TextStyle(fontSize: 14,color:  provider.currentTheme
                                          ? dark_Scaffold_color
                                          : light_Scaffold_color,),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: InkWell(
                        splashColor: orange_color,
                        onTap: (){},
                        child: Container(
                          decoration: provider.currentTheme
                              ? neu_Morphism
                              : dark_neu_Morphism,
                          margin: EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: size.height*0.01),
                          width: size.width*0.34,
                          height: size.height*0.17,
                          // color: Colors.green,
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(Icons.add, size: 35,color: orange_color,),
                                  ),
                                  TextSpan(
                                    text: "\nUpload Profile \nPicture",
                                    style: TextStyle(fontSize: 14,color:  provider.currentTheme
                                        ? dark_Scaffold_color
                                        : light_Scaffold_color,),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
// //dropdown search
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: size.width*0.44,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.020),
                    decoration: provider.currentTheme
                        ? neu_Morphism
                        : dark_neu_Morphism,
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
                      // dropdownButtonProps: DropdownButtonProps(
                      //   style: ButtonStyle()
                      // ),
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
                  Container(
                    width: size.width*0.44,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.020),
                    decoration: provider.currentTheme
                        ? neu_Morphism
                        : dark_neu_Morphism,
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: [
                        "Profession 1",
                        "Profession 2",
                        "Profession 3",
                        "Profession 4"
                      ],
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          border: InputBorder.none,
                          // labelText: "Purpose",
                          hintText: "Profession",
                        ),
                      ),
                      onChanged: print,
                      // selectedItem: "Brazil",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.020,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: size.width*0.44,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.020),
                    decoration: provider.currentTheme
                        ? neu_Morphism
                        : dark_neu_Morphism,
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: [
                        "Obsession 1",
                        "Obsession 2",
                        "Obsession 3",
                        "Obsession 4"
                      ],
                      // dropdownButtonProps: DropdownButtonProps(
                      //   style: ButtonStyle()
                      // ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          border: InputBorder.none,
                          // labelText: "Purpose",
                          hintText: "Obsession",
                        ),
                      ),
                      onChanged: print,
                      // selectedItem: "Brazil",
                    ),
                  ),
                  Container(
                    decoration: provider.currentTheme
                        ? neu_Morphism
                        : dark_neu_Morphism,
                    width: size.width*0.44,
                    height: size.height*0.055,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.020),
                    child: TextFormField(
                      controller: _date,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return " *Required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.datetime,

                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.arrow_drop_down,
                          size: 25,
                        ),
                       hintText: "Date of Birth"
                      ),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2030),
                          builder: (BuildContext context, Widget? child){
                            return Theme(
                                data: provider.currentTheme
                               ? ThemeData.light().copyWith(
                              colorScheme: ColorScheme.light(
                                primary: orange_color,
                                onPrimary: Colors.white,
                                surface:orange_color,
                                onSurface: Colors.black,
                              ),
                              dialogBackgroundColor:Colors.white,
                            )
                              : ThemeData.dark().copyWith(
                            colorScheme: ColorScheme.dark(
                            primary: orange_color,
                            onPrimary: Colors.black,
                            surface:orange_color,
                            onSurface: Colors.white,
                            ),
                            dialogBackgroundColor:Colors.black,
                            ),

                                child: child!,
                            );
                          },
                        );

                        if (pickeddate != null) {
                          setState(() {
                            _date.text =
                                DateFormat('yyyy-MM-dd').format(pickeddate);
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),


              SizedBox(
                height: size.height * 0.020,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.030),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.055,
                      height: size.height * 0.025,
                      decoration: provider.currentTheme
                          ? BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Color.fromRGBO(238, 238, 238, 1),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            color: Color.fromRGBO(174, 172, 172, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 25,
                            offset: Offset(-5, -7),
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ],
                      )
                          : BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Color.fromRGBO(25, 25, 25, 1.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(5, 7),
                            color: Color.fromRGBO(18, 18, 18, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 3,
                            offset: Offset(-3, -5),
                            color: Color.fromRGBO(33, 33, 33, 1.0),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () => setState(() {
                          isPressed1 = true;
                        }),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: isPressed1 == true
                                ? orange_color
                                : dim_white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.030,
                    ),
                    Container(
                      width: size.width*0.85,
                      child: AutoSizeText(
                        'Encourage search engines to search my profile outside the app.',
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.visible,
                        // maxLines: 2,
                      ),
                    )
                  ],
                ),
              ),


              SizedBox(
                height: size.height * 0.020,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.030),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.055,
                      height: size.height * 0.025,
                      decoration: provider.currentTheme
                          ? BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Color.fromRGBO(238, 238, 238, 1),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            color: Color.fromRGBO(174, 172, 172, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 25,
                            offset: Offset(-5, -7),
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ],
                      )
                          : BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Color.fromRGBO(25, 25, 25, 1.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(5, 7),
                            color: Color.fromRGBO(18, 18, 18, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 3,
                            offset: Offset(-3, -5),
                            color: Color.fromRGBO(33, 33, 33, 1.0),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () => setState(() {
                          isPressed2 = true;
                        }),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: isPressed2 == true
                                ? orange_color
                                : dim_white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.030,
                    ),
                    Container(
                      width: size.width*0.85,
                      child: AutoSizeText(
                        'Make my profile private and my activities visible to my friends only.',
                        style: TextStyle(fontSize: 12),
                        overflow: TextOverflow.visible,
                        // maxLines: 2,
                      ),
                    ),
                    // RichText(
                    //     textAlign: TextAlign.center,
                    //     text: TextSpan(
                    //         children: [
                    //       TextSpan(
                    //         text: "Make my profile private and my activities visible to my friends only.",
                    //         style: TextStyle(
                    //             fontSize: 12.0,
                    //             color: provider.currentTheme
                    //                 ? dim_black
                    //                 : dim_white),
                    //       ),
                    //     ]))
                  ],
                ),
              ),

              SizedBox(
                height: size.height * 0.020,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.030),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: size.width * 0.055,
                      height: size.height * 0.025,
                      decoration: provider.currentTheme
                          ? BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Color.fromRGBO(238, 238, 238, 1),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            color: Color.fromRGBO(174, 172, 172, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 25,
                            offset: Offset(-5, -7),
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ],
                      )
                          : BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Color.fromRGBO(25, 25, 25, 1.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(5, 7),
                            color: Color.fromRGBO(18, 18, 18, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 3,
                            offset: Offset(-3, -5),
                            color: Color.fromRGBO(33, 33, 33, 1.0),
                          ),
                        ],
                      ),
                      child: InkWell(
                        onTap: () => setState(() {
                          isPressed3 = true;
                        }),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: isPressed3 == true
                                ? orange_color
                                : dim_white,
                          ),
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
                                fontSize: 13.0,
                                color: provider.currentTheme
                                    ? dim_black
                                    : dim_white),
                          ),
                          TextSpan(
                            text: "Terms and Conditions",
                            style: TextStyle(
                                fontSize: 13.0,
                                color: orange_color,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrl(_url);
                              },
                          )
                        ]))
                  ],
                ),
              ),
              Container(
                  height: size.height * 0.12,
                  // color: Colors.blue,//margin: EdgeInsets.fromLTRB(0,0,0,size.height*0.050),
                  child: Center(
                    child: fieldbutton(
                        title: "Continue",
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.010,
                            horizontal: size.width * 0.010),
                        height: size.height * 0.075,
                        width: size.width * 0.82,
                        onpressed: () {
                          setState(() {
                            isPressed1 = false;
                            isPressed2 = false;
                            isPressed3 = false;
                          });
                          Navigator.pushReplacement(
                              context, custompageroute(child: PricingPlans()));
                          // print(_emailcontroller.text);
                        }),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
