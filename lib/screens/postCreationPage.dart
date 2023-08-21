import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart' as badges;
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:mybindel_test/screens/create_userPage.dart';
import 'package:mybindel_test/widgets/fieldbutton_widget.dart';
import 'package:provider/provider.dart';


import '../widgets/postOptions/postOptions_widget.dart';
import '../widgets/postOptions/withoutBadge_postOptions_widget.dart';

class PostCreationPage extends StatefulWidget {
  const PostCreationPage({super.key});

  @override
  State<PostCreationPage> createState() => _PostCreationPageState();
}

class _PostCreationPageState extends State<PostCreationPage> {
  TextEditingController _multipleLine = TextEditingController();
  bool showNotification = false;
  int notification_number = 3;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor:
          provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.047),
            color: provider.currentTheme
                ? light_Scaffold_color
                : dark_Scaffold_color,
            height: size.height * 0.060,
            width: size.width,
            // color: Colors.red,
            child: InkWell(
              onTap: () {
                print("Back button clicked");
                // Navigator.pushAndRemoveUntil(context, custompageroute(child: CreateUser()), (route) => false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: size.width * 0.060,
                      height: size.height * 0.030,
                      decoration: provider.currentTheme
                          ? const BoxDecoration(
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
                      child: Center(
                          child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: orange_color,
                        size: 17,
                      ))),
                  SizedBox(
                    width: size.width * 0.020,
                  ),
                  AutoSizeText(
                    "Back",
                    style: TextStyle(
                        color: provider.currentTheme ? dim_black : dim_white,
                        fontFamily: 'Avant',
                        fontSize: 18,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.047, vertical: size.height * 0.010),
            color: provider.currentTheme
                ? light_Scaffold_color
                : dark_Scaffold_color,
            height: size.height * 0.050,
            width: size.width,
            // color: Colors.amber,
            child: AutoSizeText(
              "Creating New Post",
              style: TextStyle(
                  color: provider.currentTheme ? dim_black : dim_white,
                  fontFamily: 'Avant',
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.045, vertical: size.height * 0.010),
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
                hintText: "What's in your mind?",
                hintStyle: const TextStyle(
                    fontSize: 14,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w500),
                contentPadding: EdgeInsets.symmetric(
                  vertical: size.height * 0.010,
                  horizontal: size.width * 0.030,
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.20,
            color: provider.currentTheme
                ? light_Scaffold_color
                : dark_Scaffold_color,
            // color: Colors.amber,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    splashColor: orange_color,
                    // highlightColor: Colors.black,
                    onTap: () {
                      print("cover photo");
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.01),
                      width: size.width * 90,
                      height: size.height * 0.18,
                      // color: Colors.deepOrange,
                      decoration: provider.currentTheme
                          ? neu_Morphism
                          : dark_neu_Morphism,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.012),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.add,
                                    size: 35,
                                    color: orange_color,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nUpload Photo/Video",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: provider.currentTheme
                                        ? dark_Scaffold_color
                                        : light_Scaffold_color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){},
                    child: postOptions(size: size,showNotification: true,notification_number: 3,text: "Tag friends",svg: "asset/post_icons/tag.svg",),
                  ),
                  InkWell(
                    onTap: (){},
                    child: postOptions(size: size,showNotification: true,notification_number: 3,text: "Share in Pages",svg: "asset/post_icons/share_page.svg",),
                  ),
                  InkWell(
                    onTap: (){},
                    child: InkWell(
                    onTap: (){},
                    child: postOptions(size: size,showNotification: true,notification_number: 3,text: "Direct message",svg: "asset/post_icons/direct_message.svg",),
                  ),
                  ),
                  //Drop down for friends to friends
                  Container(
                    width: size.width * 0.44,
                    height: size.height * 0.060,
                    margin: EdgeInsets.symmetric(
                        vertical: size.height * 0.010,
                        horizontal: size.width * 0.020),
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.008,
                        horizontal: size.width * 0.015),
                    decoration: provider.currentTheme
                        ? square_neu_Morphism
                        : square_dark_neu_Morphism,
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: ["Person 1", "Person 2", "Person 3", "Person 4"],
                      // dropdownButtonProps: DropdownButtonProps(
                      //   style: ButtonStyle()
                      // ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                            border: InputBorder.none,
                            // labelText: "Person",
                            hintText: "Friends to friends",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: provider.currentTheme
                                    ? dim_black
                                    : dim_white)),
                      ),
                      onChanged: print,
                      // selectedItem: "Brazil",
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: (){},
                    child: postOptionsWithoutBadge(size: size,text: "Add Location", svg: 'asset/post_icons/add_location.svg',),
                  ),
                  InkWell(
                    onTap: (){},
                    child: postOptionsWithoutBadge(size: size,text: "Share in Groups", svg: 'asset/post_icons/share_groups.svg',),
                  ),
                  InkWell(
                    onTap: (){},
                    child: postOptionsWithoutBadge(size: size,text: "Add in queue", svg: 'asset/post_icons/add_queue.svg',),
                  ),
                  InkWell(
                    onTap: (){},
                    child: postOptionsWithoutBadge(size: size,text: "Save in drive", svg: 'asset/post_icons/save_drive.svg',),
                  ),
                  
                ],
              ),
            ],
          ),
          Container(
              height: size.height * 0.12,
              width: size.width,
              // color: Colors.blue,
              ////margin: EdgeInsets.fromLTRB(0,0,0,size.height*0.050),
              child: Center(
                child: fieldbutton(
                    title: "Create",
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.010,
                        horizontal: size.width * 0.010),
                    height: size.height * 0.065,
                    width: size.width * 0.90,
                    onpressed: () {
                      print("Create tapped");
                    }),
              )),
        ]),
      ),
    );
  }
}





// Widget postOptions(size,notification_number,showNotification,provider) =>
// Container(
//                       width: size.width * 0.45,
//                       height: size.height * 0.065,
//                       margin: EdgeInsets.symmetric(
//                           vertical: size.height * 0.010,
//                           horizontal: size.width * 0.020,
//                           ),
//                       //  color: Colors.amber,
//                       child: badges.Badge(
//                         badgeAnimation: badges.BadgeAnimation.slide(),
//                         badgeContent:
//                             AutoSizeText(notification_number.toString()),
//                         badgeStyle: badges.BadgeStyle(
//                           badgeColor: orange_color,
//                           padding: EdgeInsets.all(5),
//                         ),
//                         position: badges.BadgePosition.custom(
//                           top: -1,
//                           end: -2,
//                         ),
//                         showBadge: showNotification,
//                         child: Container(
//                             margin: EdgeInsets.symmetric(
//                                 vertical: size.height * 0.005,
//                                 horizontal: size.width * 0.015),
//                             padding: EdgeInsets.symmetric(
//                                 vertical: size.height * 0.012,
//                                 horizontal: size.width * 0.015),
//                             width: size.width * 0.420,
//                             height: size.height * 0.060,
//                             decoration: provider.currentTheme
//                                 ? square_neu_Morphism
//                                 : square_dark_neu_Morphism,
//                             child: Row(children: [
//                               SvgPicture.asset('assetName'),
//                               AutoSizeText(
//                                 "Tag friends",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   color: provider.currentTheme
//                                       ? dim_black
//                                       : dim_white,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ])),
//                       ),
//                     );