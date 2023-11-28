import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mybindel_test/pagerouter/customPageRouter.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:mybindel_test/screens/Video/videoScreenPage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class WatchHistory extends StatefulWidget {
  const WatchHistory({super.key});

  @override
  State<WatchHistory> createState() => _WatchHistoryState();
}

class _WatchHistoryState extends State<WatchHistory> {
  bool onWatchHistory = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: (4.300).h,
                  left: (3.800).w,
                  right: (3.800).w,
                  bottom: (1.800).h),
              width: (100).w,
              height: (6.900).h,
              // color: Colors.red,
              color: provider.currentTheme
                  ? light_Scaffold_color
                  : dark_Scaffold_color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (10.00).w,
                    height: (4.500).h,
                    decoration: provider.currentTheme
                        ? square_neu_Morphism
                        : square_dark_neu_Morphism,
                    margin: EdgeInsets.symmetric(
                      vertical: (1.00).h,
                      // horizontal: ().w * 0.040
                    ),
                    child: InkWell(
                      onTap: () {
                        print("menu tapped");
                      },
                      child: Icon(
                        Icons.menu,
                        color: provider.currentTheme ? dim_black : dim_white,
                      ),
                    ),
                  ),
                  Container(
                    width: (10.00).w,
                    height: (5.00).h,
                    // color: Colors.black,
                    margin: EdgeInsets.symmetric(
                        vertical: (1.00).h, horizontal: (3.00).w),
                    child: Image.asset("asset/images/logo.png"),
                  ),
                  Container(
                    width: (14.800).w,
                    height: (6.400).h,
                    padding: EdgeInsets.symmetric(
                        vertical: (0.6).h, horizontal: (1.400).w),
                    // color: Colors.black,
                    decoration: provider.currentTheme
                        ? square_neu_Morphism
                        : square_dark_neu_Morphism,

                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        "asset/images/user_logo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: (100).w,
              height: (8.00).h,
              //color: Colors.amber,
              color: provider.currentTheme
                  ? light_Scaffold_color
                  : dark_Scaffold_color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: (75.0).w,
                    margin: EdgeInsets.symmetric(
                      // vertical: ().h * 0.010,
                        horizontal: (3.00).w),
                    decoration: provider.currentTheme
                        ? textFormField_neu_morphism
                        : dark_textFormField_neu_morphism,
                    child: TextFormField(
                      // controller: _find,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search In History",
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color:
                            provider.currentTheme ? dim_black : dim_white,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: (4.00).w )),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  Container(
                    width: (12.00).w,
                    margin: EdgeInsets.only(
                      // vertical: ().h * 0.010,
                      right: (4.00).w,
                      left: (1.50).w,
                    ),
                    decoration: provider.currentTheme
                        ? square_neu_Morphism
                        : square_dark_neu_Morphism,
                    child: IconButton(
                        onPressed: () {
                          onWatchHistory = !onWatchHistory;
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.access_time_sharp,
                          color: orange_color,
                          size: 25,
                        )),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              height: 4.h,
              // color: Colors.amber,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              child: AutoSizeText(
                "Watch History",
                softWrap: true,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade800),
              ),
            ),

            // today
            Container(
              // color: Colors.amber,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 2.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    child: AutoSizeText(
                      "Today",
                      softWrap: true,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemExtent: 8.h,
                    children: [
                      historyContainer(),
                      historyContainer(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (1.2).h,
            ),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.grey.shade400,
            ),
            SizedBox(
              height: 1.h,
            ),

            // yesterday
            Container(
              // color: Colors.amber,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 2.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    child: AutoSizeText(
                      "Yesterday",
                      softWrap: true,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemExtent: 8.h,
                    children: [
                      historyContainer(),
                      historyContainer(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (1.2).h,
            ),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: Colors.grey.shade400,
            ),
            SizedBox(
              height: 1.h,
            ),

            // specific date
            Container(
              // color: Colors.amber,
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 2.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    child: AutoSizeText(
                      "Monday, 5 August",
                      softWrap: true,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemExtent: 8.h,
                    children: [
                      historyContainer(),
                      historyContainer(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  historyContainer() {
    final provider = Provider.of<Themeprovider>(context);
    return Container(
      // color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 15.w,
            margin: EdgeInsets.only(left: (3.2).w),
            // color: Colors.green,
            child: AutoSizeText(
              "12:30PM",
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
            ),
          ),
          Container(
            height: 7.h,
            width: 70.w,
            // color: Colors.blue,
            decoration: provider.currentTheme
                ? square_neu_Morphism
                : square_dark_neu_Morphism,
            child: Row(
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
                AutoSizeText(
                  "Word of Friends",
                  style: TextStyle(
                      fontSize: 20,
                      // letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                      color: provider.currentTheme ? dim_black : dim_white),
                ),
              ],
            ),
          ),
          Container(
            width: 8.w,
            height: (3.2).h,
            margin: EdgeInsets.only(right: (1.5).w, left: (0.5).w),
            // color : Colors.red,
            child: InkWell(
              radius: 5,
              onTap: () {},
              child: Icon(
                Icons.close,
                color: Colors.grey.shade500,
              ),
            ),
          )
        ],
      ),
    );
  }
}