import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:mybindel_test/screens/FriendScreens/FriendTabBar.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class FriendScreenMain extends StatefulWidget {
  const FriendScreenMain({super.key});

  @override
  State<FriendScreenMain> createState() => _FriendScreenMainState();
}

class _FriendScreenMainState extends State<FriendScreenMain>
    with TickerProviderStateMixin {
  bool onFriendRequest = false;
  late TabController tabController =
      tabController = TabController(length: 3, vsync: this);
  Color unselectedLabelColor_custom = Colors.grey.shade600;

  

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);

    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      hintText: "Search in Friends",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: provider.currentTheme ? dim_black : dim_white,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: (4.00).w)),
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
                      setState(() {
                        onFriendRequest = !onFriendRequest;
                      });
                      // Navigator.push(context, custompageroute(child: StoryCreationPage()));
                    },
                    icon: Icon(
                      Icons.people_rounded,
                      color: onFriendRequest == true
                          ? orange_color
                          : Colors.grey.shade800,
                      size: 25,
                    )),
              )
            ],
          ),
          SizedBox(
            height: (0.8).h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: (0.2).w, vertical: (0.1).h),
                margin: EdgeInsets.symmetric(horizontal: (3.2).w),
                color: provider.currentTheme
                    ? light_Scaffold_color
                    : dark_Scaffold_color,
                height: (3.5).h,
                width: 25.w,
                // color: Colors.amber,
                child: AutoSizeText(
                  "Add Music",
                  style: TextStyle(
                      color: provider.currentTheme ? dim_black : dim_white,
                      fontFamily: 'Avant',
                      fontSize: 22,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Card(
                elevation: 0,
                // shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(5)),
                child: Container(
                  decoration: provider.currentTheme
                      ? textFormField_neu_morphism
                      : dark_textFormField_neu_morphism,
                  height: 3.h,
                  child: TabBar(
                      indicator: provider.currentTheme
                          ? indicator_neu_Morphism
                          : indicator_dark_neu_Morphism,
                      labelColor: Colors.grey.shade900,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.8,
                          ),
                      unselectedLabelColor: unselectedLabelColor_custom,
                      controller: tabController,
                      isScrollable: true,
                      labelPadding: EdgeInsets.symmetric(
                          horizontal: (2.2).w, vertical: (0.2).h),
                      tabs: const [
                        Tab(
                          child: Text(
                            "Friends",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Muted",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Blocked",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
          Expanded(
              child: TabBarView(
                controller: tabController,
            children: [
              FriendTabBar(),
              FriendTabBar(),
              FriendTabBar(),
            ],
          ))
        ],
      ),
    );
  }
}
