import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mybindel_test/screens/pricingPlans.dart';
import 'package:mybindel_test/screens/second_create_userPage.dart';
import 'package:mybindel_test/screens/welcomePage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import '../pagerouter/customPageRouter.dart';
import '../palette/palette.dart';
import '../providers/selectTheme.dart';
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
  TextEditingController _website = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _nickName = TextEditingController();
  TextEditingController _multipleLine = TextEditingController();
  TextEditingController _verify = TextEditingController();
  TextEditingController _date = TextEditingController();

  final Uri _url = Uri.parse('https://www.google.com/');
  // bool isPressed1 = false;
  bool isPressed1 = false;
  bool isPressed2 = false;
  bool isPressed3 = false;

  @override
  Widget build(BuildContext context) {
    final theme =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    final provider = Provider.of<Themeprovider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor:
          provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
      body: Column(
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
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.047),
              color: provider.currentTheme
                  ? light_Scaffold_color
                  : dark_Scaffold_color,
              // color: Colors.orange,
              height: size.height * 0.80,
              width: size.width,
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: size.width * 0.004,
                            right: size.width * 0.005,
                            bottom: size.height * 0.015,
                        ),
                        child: const Text(
                          "Create New",
                          style: TextStyle(
                              fontFamily: 'Avant',
                              fontSize: 21,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w700),
                        ),
                      ),

                      SizedBox(width: size.width * 0.010),
                      //f_name and l_name
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                                  height: size.height * 0.060,
                                  width: size.width * 0.402,
                                  decoration: provider.currentTheme
                                      ? textFormField_neu_morphism
                                      : dark_textFormField_neu_morphism,
                                  child: f_nameTextfield(_fname, size))),
                          SizedBox(
                            width: size.width * 0.050,
                          ),
                          Expanded(
                              child: Container(
                                  height: size.height * 0.060,
                                  width: size.width * 0.402,
                                  decoration: provider.currentTheme
                                      ? textFormField_neu_morphism
                                      : dark_textFormField_neu_morphism,
                                  child: l_nameTextfield(_lname, size))),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      //Email address
                      Container(
                        height: size.height * 0.055,
                        // width: size.width * 0.852,
                        decoration: provider.currentTheme
                            ? textFormField_neu_morphism
                            : dark_textFormField_neu_morphism,
                        child: e_mailTextfield(_email, size),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      //Phone number
                      Container(
                        height: size.height * 0.055,
                        // width: size.width * 0.852,
                        decoration: provider.currentTheme
                            ? textFormField_neu_morphism
                            : dark_textFormField_neu_morphism,
                        child: c_noTextfield(_contact, size),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      //add user name
                      Container(
                        height: size.height * 0.068,
                        // width: size.width * 0.852,
                        decoration: provider.currentTheme
                            ? textFormField_neu_morphism
                            : dark_textFormField_neu_morphism,
                        child: addressTextfield(_address, size),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),

                      //website
                      Container(
                        height: size.height * 0.055,
                        // width: size.width * 0.852,
                        decoration: provider.currentTheme
                            ? textFormField_neu_morphism
                            : dark_textFormField_neu_morphism,
                        child:  TextFormField(
                          controller: _website,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffix: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Add more",
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: TextStyle(color: theme == Brightness.light ? dim_black : dim_white, fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.w500),
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              // vertical: size.height * 0.010,
                                horizontal: size.width * 0.030),
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                // fontFamily: 'Avant',
                                // color: Color.fromRGBO(94, 94, 94, 1),
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                            hintText: "Website",
                          ),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),
                      
                      // //password
                      // Container(
                      //   height: size.height * 0.055,
                      //   // width: size.width * 0.852,
                      //   decoration: provider.currentTheme
                      //       ? textFormField_neu_morphism
                      //       : dark_textFormField_neu_morphism,
                      //   child: TextFormField(
                      //     controller: _pass,
                      //     decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       contentPadding: EdgeInsets.symmetric(
                      //           vertical: size.height * 0.010,
                      //           horizontal: size.width * 0.030),
                      //       hintStyle: const TextStyle(
                      //           fontSize: 14,
                      //           letterSpacing: 1,
                      //           fontWeight: FontWeight.w500),
                      //       hintText: "Password",
                      //     ),
                      //     keyboardType: TextInputType.text,
                      //     textInputAction: TextInputAction.next,
                      //     autovalidateMode: AutovalidateMode.onUserInteraction,
                      //     onChanged: (val) {
                      //       if (_formKey.currentState!.validate()) {
                      //         _formKey.currentState!.save();
                      //       }
                      //     },
                      //     validator: (value) {
                      //       if (value!.isEmpty ||
                      //           RegExp(r"\s").hasMatch(value)) {
                      //         return "Enter correct Password";
                      //       } else {
                      //         return null;
                      //       }
                      //     },
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: size.height * 0.020,
                      // ),

                      // //confirm password
                      // Container(
                      //   height: size.height * 0.055,
                      //   // width: size.width * 0.852,
                      //   decoration: provider.currentTheme
                      //       ? textFormField_neu_morphism
                      //       : dark_textFormField_neu_morphism,
                      //   child: TextFormField(
                      //     controller: _confirmPass,
                      //     decoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       contentPadding: EdgeInsets.symmetric(
                      //         vertical: size.height * 0.010,
                      //         horizontal: size.width * 0.030,
                      //       ),
                      //       hintStyle: const TextStyle(
                      //           fontSize: 14,
                      //           letterSpacing: 1,
                      //           fontWeight: FontWeight.w500),
                      //       hintText: "Confirm Password",
                      //     ),
                      //     keyboardType: TextInputType.text,
                      //     textInputAction: TextInputAction.next,
                      //     autovalidateMode: AutovalidateMode.onUserInteraction,
                      //     onChanged: (val) {
                      //       if (_formKey.currentState!.validate()) {
                      //         _formKey.currentState!.save();
                      //       }
                      //     },
                      //     validator: (value) {
                      //       if (value!.isEmpty ||
                      //           RegExp(r"\s").hasMatch(value)) {
                      //         return "Enter correct Password";
                      //       } else {
                      //         return null;
                      //       }
                      //     },
                      //   ),
                      // ),
                      
                      
                      //nickname
                     Container(
                        height: size.height * 0.068,
                        // width: size.width * 0.852,
                        decoration: provider.currentTheme
                            ? textFormField_neu_morphism
                            : dark_textFormField_neu_morphism,
                        child: nickNameTextfield(_nickName, size),
                      ),
                      SizedBox(
                        height: size.height * 0.020,
                      ),

                      //Country, city , etc.... rows
                    SizedBox(
                        height: size.height * 0.020,
                      ),
                    Row(
                        children: [
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 1.2.w),
                                  height: size.height * 0.060,
                                  width: size.width * 0.402,
                                  decoration: provider.currentTheme
                                        ? square_neu_Morphism
                                        : square_dark_neu_Morphism,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          margin: EdgeInsets.symmetric(horizontal: 2.2.w, vertical: 1.h),
                                          // color: Colors.amber,
                                          width: size.width*0.180,
                                          height: size.height*0.030,
                                          child: AutoSizeText("Country*",softWrap: true, style: TextStyle(fontSize: 17),),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                           margin: EdgeInsets.only(right: 4.2.w, left: 1.w),
                                           width: size.width*0.080,
                                          height: size.height*0.035,
                                          decoration: provider.currentTheme
                                        ? square_neu_Morphism
                                        : square_dark_neu_Morphism,
                                          child: InkWell(
                                            onTap: () {
                                              
                                            },
                                            child: Icon(Icons.add)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ),
                                  ),
                          SizedBox(
                            width: size.width * 0.050,
                          ),
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 1.2.w),
                                  height: size.height * 0.060,
                                  width: size.width * 0.402,
                                  decoration: provider.currentTheme
                                        ? square_neu_Morphism
                                        : square_dark_neu_Morphism,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          margin: EdgeInsets.symmetric(horizontal: 2.2.w, vertical: 1.h),
                                          // color: Colors.amber,
                                          width: size.width*0.180,
                                          height: size.height*0.030,
                                          child: AutoSizeText("City*",softWrap: true, style: TextStyle(fontSize: 17),),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                           margin: EdgeInsets.only(right: 4.2.w, left: 1.w),
                                           width: size.width*0.080,
                                          height: size.height*0.035,
                                          decoration: provider.currentTheme
                                        ? square_neu_Morphism
                                        : square_dark_neu_Morphism,
                                          child: InkWell(
                                            onTap: () {
                                              
                                            },
                                            child: Icon(Icons.add)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ),),
                        ],
                      ),

                      SizedBox(
                        height: size.height * 0.020,
                      ),

                      Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: size.width*0.42,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.020),
                    decoration: provider.currentTheme
                        ? square_neu_Morphism
                        : square_dark_neu_Morphism,
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        // showSearchBox: true,
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: [
                        "Male",
                        "Female",
                        "Other",
                      ],
                      // dropdownButtonProps: DropdownButtonProps(
                      //   style: ButtonStyle()
                      // ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          border: InputBorder.none,
                          // labelText: "Purpose",
                          hintText: "Gender*",
                          hintStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.w400)
                        ),
                      ),
                      onChanged: print,
                      // selectedItem: "Brazil",
                    ),
                  ),
                   SizedBox(
                height: size.width * 0.040,
              ),
                  Container(
                    width: size.width*0.42,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.020),
                    decoration: provider.currentTheme
                        ? square_neu_Morphism
                        : square_dark_neu_Morphism,
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        // showSearchBox: true,
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: [
                        "Relationship Status 1",
                        "Relationship Status 2",
                        "Relationship Status 3",
                      ],
                      // dropdownButtonProps: DropdownButtonProps(
                      //   style: ButtonStyle()
                      // ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          border: InputBorder.none,
                          // labelText: "Purpose",
                          hintText: "Relationship \nStatus*",
                          hintStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.w400, fontSize: 15)
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
                        children: [
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 1.2.w),
                                  height: size.height * 0.060,
                                  width: size.width * 0.402,
                                  decoration: provider.currentTheme
                                        ? square_neu_Morphism
                                        : square_dark_neu_Morphism,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          margin: EdgeInsets.symmetric(horizontal: 2.2.w, vertical: 1.h),
                                          // color: Colors.amber,
                                          width: size.width*0.180,
                                          height: size.height*0.030,
                                          child: AutoSizeText("Education*",softWrap: true, style: TextStyle(fontSize: 17),),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                           margin: EdgeInsets.only(right: 4.2.w, left: 1.w),
                                           width: size.width*0.080,
                                          height: size.height*0.035,
                                          decoration: provider.currentTheme
                                        ? square_neu_Morphism
                                        : square_dark_neu_Morphism,
                                          child: InkWell(
                                            onTap: () {
                                              
                                            },
                                            child: Icon(Icons.add)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ),
                                  ),
                          SizedBox(
                            width: size.width * 0.050,
                          ),
                          Expanded(
                              child: Container(
                                margin: EdgeInsets.only(right: 1.2.w),
                                  height: size.height * 0.060,
                                  width: size.width * 0.402,
                                  decoration: provider.currentTheme
                                        ? square_neu_Morphism
                                        : square_dark_neu_Morphism,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          margin: EdgeInsets.symmetric(horizontal: 2.2.w, vertical: 1.h),
                                          // color: Colors.amber,
                                          width: size.width*0.180,
                                          height: size.height*0.030,
                                          child: AutoSizeText("Job*",softWrap: true, style: TextStyle(fontSize: 17),),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                           margin: EdgeInsets.only(right: 4.2.w, left: 1.w),
                                           width: size.width*0.080,
                                          height: size.height*0.035,
                                          decoration: provider.currentTheme
                                        ? square_neu_Morphism
                                        : square_dark_neu_Morphism,
                                          child: InkWell(
                                            onTap: () {
                                              
                                            },
                                            child: Icon(Icons.add)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  ),),
                        ],
                      ),

                     SizedBox(
                        height: size.height * 0.020,
                      ),

                      Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: size.width*0.42,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.020),
                    decoration: provider.currentTheme
                        ? square_neu_Morphism
                        : square_dark_neu_Morphism,
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        // showSearchBox: true,
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: [
                        "Purpose 1",
                        "Purpose 2",
                        "Purpose 3",
                      ],
                      // dropdownButtonProps: DropdownButtonProps(
                      //   style: ButtonStyle()
                      // ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          border: InputBorder.none,
                          // labelText: "Purpose",
                          hintText: "Purpose*",
                          hintStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.w400)
                        ),
                      ),
                      onChanged: print,
                      // selectedItem: "Brazil",
                    ),
                  ),
                   SizedBox(
                height: size.width * 0.040,
              ),
                  Container(
                    width: size.width*0.42,
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.020),
                    decoration: provider.currentTheme
                        ? square_neu_Morphism
                        : square_dark_neu_Morphism,
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        // showSearchBox: true,
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: [
                        "10.90",
                        "11.12",
                        "9.80",
                      ],
                      // dropdownButtonProps: DropdownButtonProps(
                      //   style: ButtonStyle()
                      // ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          border: InputBorder.none,
                          // labelText: "Purpose",
                          hintText: "Interest*",
                          hintStyle: TextStyle(color: Colors.grey.shade900, fontWeight: FontWeight.w400)
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

                      //about Yourself
                      Container(
                        decoration: provider.currentTheme
                            ? textFormField_neu_morphism
                            : dark_textFormField_neu_morphism,
                        child: TextFormField(
                          controller: _multipleLine,
                          keyboardType: TextInputType.multiline,
                          minLines: 5,
                          maxLines: 7,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "About yourself",
                            hintStyle: const TextStyle(
                                fontSize: 14,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w500),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: size.height * 0.010,
                              horizontal: size.width * 0.030,
                            ),
                          ),
                        ),
                      ),
                      
                      SizedBox(
                      height: size.height * 0.020,
                      ),

                      //cover photo
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
                          margin: EdgeInsets.symmetric(horizontal: size.width * 0.03,vertical: size.height*0.002),
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
                      
                      //check boxes of permissions
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
                              width: size.width*0.75,
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
                              width: size.width*0.75,
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



                      // SizedBox(
                      //   height: size.height * 0.010,
                      // ),
                      // Row(
                      //   children: [
                      //     Container(
                      //       width: size.width * 0.095,
                      //       height: size.height * 0.040,
                      //       decoration: provider.currentTheme
                      //           ? textFormField_neu_morphism
                      //           : dark_textFormField_neu_morphism,
                      //       child: IconButton(
                      //         color: provider.currentTheme
                      //             ? light_Scaffold_color
                      //             : dark_Scaffold_color,
                      //         onPressed: () {
                      //           setState(() {
                      //             isPressed1 = true;
                      //           });
                      //         },
                      //         icon: Icon(
                      //           Icons.check,
                      //           color: isPressed1 == true
                      //               ? orange_color
                      //               : dim_white,
                      //         ),
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: size.width * 0.030,
                      //     ),
                      //     RichText(
                      //       textAlign: TextAlign.center,
                      //         text: TextSpan(children: [
                      //       TextSpan(
                      //         text: "I agreed to the ",
                      //         style: TextStyle(
                      //           fontSize: 15.0,
                      //             color: provider.currentTheme
                      //                 ? dim_black
                      //                 : dim_white),
                      //       ),
                      //       TextSpan(
                      //         text: "Terms and Conditions",
                      //         style: TextStyle(
                      //             fontSize: 15.0,
                      //             color: orange_color),
                      //         recognizer: TapGestureRecognizer()
                      //           ..onTap = () {
                      //             launchUrl(_url);
                      //           },
                      //       )
                      //     ]))
                      //   ],
                      // ),
                    


                    
                    
                    
                    Container(
                        height: size.height * 0.12,
                        // color: Colors.blue,//margin: EdgeInsets.fromLTRB(0,0,0,size.height*0.050),
                        child: Center(
                          child: fieldbutton(
                              title: "Create",
                              padding: EdgeInsets.symmetric(
                                  vertical: size.height * 0.010,
                                  horizontal: size.width * 0.010),
                              height: size.height * 0.075,
                              width: size.width * 0.82,
                              onpressed: () {
                                setState(() {
                                  isPressed1 = false;
                                });
                                // Navigator.pushReplacement(
                                //     context, custompageroute(child: SecondCreateUserPage(_email.text)));
                                // // print(_emailcontroller.text);
                              }),
                        )),

                  
        ],
      ),
                ))))])
    );
  }
}

Widget f_nameTextfield(TextEditingController _fname, Size size) =>
    TextFormField(
      controller: _fname,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.010, horizontal: size.width * 0.030),
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
Widget l_nameTextfield(TextEditingController _lname, Size size) =>
    TextFormField(
        controller: _lname,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              vertical: size.height * 0.010, horizontal: size.width * 0.030),
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

Widget e_mailTextfield(TextEditingController _email, Size size) =>
    TextFormField(
      controller: _email,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.010, horizontal: size.width * 0.030),
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
Widget c_noTextfield(TextEditingController _contact, Size size) =>
    TextFormField(
      controller: _contact,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.010, horizontal: size.width * 0.030),
        hintStyle: const TextStyle(
            fontSize: 14, letterSpacing: 1, fontWeight: FontWeight.w500),
        hintText: "Phone Number",
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
      ],
      textInputAction: TextInputAction.next,
      // validator: (value) {
      //   if (value!.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(value)) {
      //     RegExp(
      //         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
      //     return "Enter correct number";
      //   } else {
      //     return null;
      //   }
      // },
    );
Widget websiteTextfield(TextEditingController _website, Size size ) =>
    TextFormField(
      controller: _website,
      decoration: InputDecoration(
        border: InputBorder.none,
        suffix: TextButton(
          onPressed: () {},
          child: Text(
            "Add more",
            textAlign: TextAlign.center,
            softWrap: true,
            style: TextStyle(color: dim_black, fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.w500),
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
            // vertical: size.height * 0.010,
            horizontal: size.width * 0.030),
        hintStyle: const TextStyle(
            fontSize: 14,
            // fontFamily: 'Avant',
            // color: Color.fromRGBO(94, 94, 94, 1),
            letterSpacing: 1,
            fontWeight: FontWeight.w500),
        hintText: "Website",
      ),
      textInputAction: TextInputAction.next,
    );
Widget addressTextfield(TextEditingController _address, Size size) =>
    TextFormField(
      controller: _address,
      decoration: InputDecoration(
        // suffix: TextButton(
        //   onPressed: () {},
        //   child: Text(
        //     "Username",
        //     textAlign: TextAlign.center,
        //     softWrap: true,
        //     style: TextStyle(color: orange_color, fontSize: 15, letterSpacing: 1, fontWeight: FontWeight.w500),
        //   ),
        // ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.00,
            horizontal: size.width * 0.030),
        hintStyle: const TextStyle(
            fontSize: 14, letterSpacing: 1, fontWeight: FontWeight.w500),
        hintText: "Address",
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return "Address must not be empty";
        } else {
          return null;
        }
      },
    );
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

Widget nickNameTextfield(TextEditingController _nickName, Size size) =>
    TextFormField(
      controller: _nickName,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(
            vertical: size.height * 0.00,
            horizontal: size.width * 0.030),
        hintStyle: const TextStyle(
            fontSize: 14, letterSpacing: 1, fontWeight: FontWeight.w500),
        hintText: "Nickname",
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value!.isEmpty) {
          return "Nickname must not be empty";
        } else {
          return null;
        }
      },
    );
