import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class WatchHistory extends StatefulWidget {
  const WatchHistory({super.key});

  @override
  State<WatchHistory> createState() => _WatchHistoryState();
}

class _WatchHistoryState extends State<WatchHistory> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
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