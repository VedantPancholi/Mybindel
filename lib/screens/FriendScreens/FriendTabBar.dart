import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FriendTabBar extends StatelessWidget {
  List<String> friendsList = [
    'Aiden',
    'Alice',
    'Alex',
    'Amelia',
    'Andrew',
    'Anna',
    'Benjamin',
    'Brooke',
    'Brandon',
    'Bella',
    'Caleb',
    'Chloe',
    'Christopher',
    'Charlotte',
    'Daniel',
    'David',
    'Diana',
    'Dylan',
    'Emily',
    'Ethan',
    'Elizabeth',
    'Ella',
    'Finn',
    'Fiona',
    'Faith',
    'Gabriel',
    'Grace',
    'Gavin',
    'Hannah',
    'Henry',
    'Haley',
    'Isaac',
    'Isabella',
    'Ivy',
    'Ian',
    'Jackson',
    'Julia',
    'Jacob',
    'James',
    'Kevin',
    'Kayla',
    'Kyle',
    'Katherine',
    'Liam',
    'Lily',
    'Lucas',
    'Leah',
    'Mason',
    'Mia',
    'Michael',
    'Madison',
    'Noah',
    'Natalie',
    'Nathan',
    'Olivia',
    'Owen',
    'Sophia',
    'Samuel',
    'Samantha',
    'Thomas',
    'Taylor',
    'Tyler',
    'Victoria',
    'Violet',
    'Vincent',
    'Valerie',
    'William',
    'Willow',
    'Wyatt',
    'Xavier',
    'Ximena',
    'Xander',
    'Yasmine',
    'Yvonne',
    'Yara',
    'Zachary',
    'Zoe',
    'Zane',
    'Zara'
  ];

  FriendTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.2,
            motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: (val) {},
              backgroundColor: const Color.fromARGB(255, 253, 59, 0),
              icon: Icons.block_rounded,
            )
          ]),
          endActionPane: ActionPane(
            extentRatio: 0.2,
            motion: DrawerMotion(), children: [
            SlidableAction(
              onPressed: (val2) {},
              icon: Icons.person_off,
              backgroundColor: const Color.fromARGB(255, 253, 59, 0),
            ),
          ]),
          child: InkWell(
            onTap: () {
              print(index);
            },
            child: Container(
              height: (8).h,
              width: (90).w,
              margin: EdgeInsets.only(
                  right: 4.5.w, bottom: 1.2.h, top: 0.5.h, left: 4.4.w),
              alignment: Alignment.centerLeft,
              decoration: provider.currentTheme
                  ? square_neu_Morphism
                  : square_dark_neu_Morphism,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: (0.8).h, horizontal: (2.2).w),
                        child: Container(
                          width: (12.0).w,
                          height: (6.0).h,
                          // decoration: square_neu_Morphism,
                          child: Stack(children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.asset(
                                "asset/music_icons/music_bg.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Container(
                                  color: Colors.red,
                                  width: (2.500).w,
                                  height: (1.200).h,
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: friendsList.elementAt(index),
                                  style: TextStyle(
                                      fontSize: 20,
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w500,
                                      color: provider.currentTheme
                                          ? dim_black
                                          : dim_white),
                                ),
                                WidgetSpan(
                                  alignment: PlaceholderAlignment.top,
                                  child: Container(
                                      width: 4.2.w,
                                      height: 2.0.h,
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.only(
                                          bottom: 0.5.h, left: 1.2.w),
                                      child: Image.asset(
                                          "asset/images/check.png")),
                                ),
                              ],
                            ),
                          ),
                          AutoSizeText(
                            "Artist".toUpperCase(),
                            style: TextStyle(
                                color: orange_color,
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          print("1st icon");
                        },
                        child: Container(
                          width: (7.00).w,
                          height: (3.60).h,
                          margin: EdgeInsets.only(right: 2.w),
                          decoration: provider.currentTheme
                              ? music_listTile_neu_Morphism
                              : music_listTile_dark_neu_Morphism,
                          child: Center(
                            child: SvgPicture.asset(
                              'asset/icons/Messages.svg',
                              // width: (4.40).w,
                              // height: (2.30).h,
                              // color: orange_color,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("2nd icon");
                        },
                        child: Container(
                          width: (7.00).w,
                          height: (3.60).h,
                          margin: EdgeInsets.only(right: 2.w),
                          decoration: provider.currentTheme
                              ? music_listTile_neu_Morphism
                              : music_listTile_dark_neu_Morphism,
                          child: Center(
                            child: SvgPicture.asset(
                              'asset/icons/Calls.svg',
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("3rd icon");
                        },
                        child:Container(
                                    height: (3.2).h,
                                    width: (6.5).w,
                                    margin: EdgeInsets.only(right: 2.w),
                                    decoration: provider.currentTheme
                              ? music_listTile_neu_Morphism
                              : music_listTile_dark_neu_Morphism,
                                    child: popUpMenuFriend(provider)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


Widget popUpMenuFriend(provider) {
  return PopupMenuButton(
    onOpened: () {},
    onCanceled: () {},
    color: provider.currentTheme
        ? light_Scaffold_color
        : dark_Scaffold_color, //Color.fromRGBO(204, 204, 204, 0.4),
    padding: const EdgeInsets.all(0),
    constraints: BoxConstraints.expand(width: (44.2).w, height: (48.00).h),
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
                child: SvgPicture.asset("asset/friend_nonFriend_screen_icon/View Profile.svg")
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: (2.2).w),
                  alignment: Alignment.centerLeft,
                  // color: Colors.yellow,
                  child: Text(
                    'View Profile',
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
                child: SvgPicture.asset("asset/friend_nonFriend_screen_icon/Message.svg")
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: (2.2).w),
                  alignment: Alignment.centerLeft,
                  // color: Colors.yellow,
                  child: Text(
                    'Message',
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
                child: SvgPicture.asset("asset/icons/Calls.svg")
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: (2.2).w),
                  alignment: Alignment.centerLeft,
                  // color: Colors.yellow,
                  child: Text(
                    'Call',
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
                child: SvgPicture.asset("asset/friend_nonFriend_screen_icon/Mute.svg")
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: (2.2).w),
                  alignment: Alignment.centerLeft,
                  // color: Colors.yellow,
                  child: Text(
                    'Mute',
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
                child: SvgPicture.asset("asset/friend_nonFriend_screen_icon/Unfriend.svg")
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: (2.2).w),
                  alignment: Alignment.centerLeft,
                  // color: Colors.yellow,
                  child: Text(
                    'Unfriend',
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
                    'Block Messages',
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
