import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:mybindel_test/screens/NonFriendScreens/NonFriendPost.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NonFriendScreen_main extends StatefulWidget {
  const NonFriendScreen_main({super.key});

  @override
  State<NonFriendScreen_main> createState() => _NonFriendScreen_mainState();
}

class _NonFriendScreen_mainState extends State<NonFriendScreen_main>
    with TickerProviderStateMixin {
  late TabController nonFriendtabController =
      nonFriendtabController = TabController(length: 4, vsync: this);
  bool tapAddFriend = false;
  Color unselectedLabelColor_custom = Colors.grey.shade600;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: (1.2).w),
            width: 100.w,
            height: 40.h,
            // color: Colors.black,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Image.asset(
                            "asset/images/user_post.png",
                            width: 100.w,
                            height: 18.h,
                            fit: BoxFit.cover,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 30.w),
                      height: (8.5).h,
                      width: 100.w,
                      // color: Colors.amber,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: (0.3).h, horizontal: (0.5).w),
                                  child: AutoSizeText(
                                    "John David",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                Icon(
                                  Icons.check,
                                  size: 15,
                                  color: orange_color,
                                ),
                                Container(
                                  child: AutoSizeText(
                                    "Johnny",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: (0.3).h, horizontal: (0.5).w),
                              child: AutoSizeText(
                                "Artist".toUpperCase(),
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.deepOrange.shade700,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  height: (2.8).h,
                                  width: (20.5).w,
                                  margin: EdgeInsets.only(right: (1.2).w),
                                  padding: EdgeInsets.symmetric(
                                      vertical: (0.5).h, horizontal: (1.5).w),
                                  decoration: provider.currentTheme
                                      ? square_neu_Morphism
                                      : square_dark_neu_Morphism,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        tapAddFriend = !tapAddFriend;
                                        print(tapAddFriend);
                                      });
                                    },
                                    child: Center(
                                      child: AutoSizeText(
                                          tapAddFriend == true
                                              ? "Request sent"
                                              : "Add friend",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: tapAddFriend == true
                                                  ? Colors.deepOrange.shade600
                                                  : provider.currentTheme
                                                      ? dim_black
                                                      : dim_white,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ),
                                Container(
                                    height: (2.8).h,
                                    width: (6.5).w,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: (1.2).w),
                                    decoration: provider.currentTheme
                                        ? square_neu_Morphism
                                        : square_dark_neu_Morphism,
                                    child: popUpMenuNonFriend(provider)),
                              ],
                            ),
                          ]),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: (0.5).h),
                      padding: EdgeInsets.symmetric(
                          vertical: 0.5.h, horizontal: 1.5.w),
                      width: 100.w,
                      child: AutoSizeText(
                        "In the World of Friends, the possibilities are boundless. Connect with old pals and make new ones from all corners of the globe. Share your thoughts, photos, and experiences with ease, and let your creativity soar through engaging posts and captivating stories.",
                        softWrap: true,
                        wrapWords: true,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade700),
                      ),
                    )
                  ],
                ),
                Positioned(
                  left: 5,
                  top: 100,
                  child: Container(
                    decoration: provider.currentTheme
                        ? nonFriend_square_neu_Morphism
                        : nonFriend_square_dark_neu_Morphism,
                    padding: EdgeInsets.all((1.2).w),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          "asset/images/user_post.png",
                          width: 25.w,
                          height: 12.h,
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.only(left: (2.5).w, bottom: (1.2).h, right: (2.5).w),
            elevation: 0,
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(5)),
            child: Container(
              decoration: provider.currentTheme
                  ? BoxDecoration(
                      color: Colors.grey.shade200,
                    )
                  : BoxDecoration(
                      color: Colors.grey.shade800,
                    ),
              // decoration: provider.currentTheme
              //     ? textFormField_neu_morphism
              //     : dark_textFormField_neu_morphism,
              height: 3.h,
              child: TabBar(
                  indicator: provider.currentTheme
                      ? indicator_neu_Morphism
                      : indicator_dark_neu_Morphism,
                  labelColor: Colors.deepOrange.shade600,
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.4,
                  ),
                  unselectedLabelColor: unselectedLabelColor_custom,
                  controller: nonFriendtabController,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(
                      horizontal: (2.8).w, vertical: (0.2).h),
                  tabs: const [
                    Tab(
                      child: Text(
                        "Post",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Media",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Friends",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "About",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ]),
            ),
          ),
          SizedBox(
            height: 100.h,
              child: TabBarView(
                physics: BouncingScrollPhysics(),
            controller: nonFriendtabController,
            children: [
              NonFriendPost(),
              NonFriendPost(),
              NonFriendPost(),
              NonFriendPost(),
            ],
          ))
        ],
      ),

    );
  }
}

Widget popUpMenuNonFriend(provider) {
  return PopupMenuButton(
    onOpened: () {},
    onCanceled: () {},
    color: provider.currentTheme
        ? light_Scaffold_color
        : dark_Scaffold_color, //Color.fromRGBO(204, 204, 204, 0.4),
    padding: const EdgeInsets.all(0),
    constraints: BoxConstraints.expand(width: (44.2).w, height: (18.00).h),
    position: PopupMenuPosition.over,
    offset: const Offset(-10, 30),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    ),
    elevation: 3,
    icon: Icon(
      Icons.more_horiz_rounded,
      color: Colors.transparent.withOpacity(0.8),
      size: 25,
    ),
    itemBuilder: (context) => [
      PopupMenuItem(
        child: Container(
          height: (4.55).h,
          // color: Colors.red,
          child: Row(
            children: [
              Container(
                height: (3).h,
                width: (7.0).w,
                padding: EdgeInsets.all((0.8).w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade600.withOpacity(0.5)),
                    color: provider.currentTheme
                        ? light_Scaffold_color
                        : dark_Scaffold_color,
                    borderRadius: BorderRadius.circular(5)),
                child: SvgPicture.asset("asset/friend_nonFriend_screen_icon/Cancel Request.svg")
              ),  
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: (2.2).w),
                  alignment: Alignment.centerLeft,
                  // color: Colors.yellow,
                  child: Text(
                    'Cancel Request',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      PopupMenuItem(
        child: Container(
          height: (4.55).h,
          // color: Colors.red,
          child: Row(
            children: [
              Container(
                height: (3).h,
                width: (7.0).w,
                padding: EdgeInsets.all((0.8).w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade600.withOpacity(0.5)),
                    color: provider.currentTheme
                        ? light_Scaffold_color
                        : dark_Scaffold_color,
                    borderRadius: BorderRadius.circular(5)),
                child: SvgPicture.asset("asset/friend_nonFriend_screen_icon/Block Person.svg")
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: (2.2).w),
                  alignment: Alignment.centerLeft,
                  // color: Colors.yellow,
                  child: Text(
                    'Block Person',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      PopupMenuItem(
        child: Container(
          height: (4.55).h,
          // color: Colors.red,
          child: Row(
            children: [
              Container(
                height: (3).h,
                width: (7.0).w,
                padding: EdgeInsets.all((0.8).w),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade600.withOpacity(0.5)),
                    color: provider.currentTheme
                        ? light_Scaffold_color
                        : dark_Scaffold_color,
                    borderRadius: BorderRadius.circular(5)),
                child: SvgPicture.asset("asset/friend_nonFriend_screen_icon/Report.svg",color: Colors.black,)
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: (3.2).w),
                  alignment: Alignment.centerLeft,
                  // color: Colors.yellow,
                  child: Text(
                    'Report',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
