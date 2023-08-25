import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mybindel_test/screens/Home/Music/yourSound_listView.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../palette/palette.dart';
import '../../../providers/selectTheme.dart';
import 'Trending_listView.dart';

class AddMusicPage extends StatefulWidget {
  const AddMusicPage({super.key});

  @override
  State<AddMusicPage> createState() => _AddMusicPageState();
}

class _AddMusicPageState extends State<AddMusicPage>
    with TickerProviderStateMixin {
  late TabController tabController =
      tabController = TabController(length: 4, vsync: this);
    Color unselectedLabelColor_custom = Colors.grey.shade600;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
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
                    onTap: () {},
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
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.047),
            color: provider.currentTheme
                ? light_Scaffold_color
                : dark_Scaffold_color,
            height: size.height * 0.050,
            width: size.width,
            // color: Colors.red,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                // Navigator.pushAndRemoveUntil(context, custompageroute(child: CreateUser()), (route) => false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: size.width * 0.060,
                      height: size.height * 0.030,
                      decoration: provider.currentTheme
                          ? BoxDecoration(
                              color: const Color.fromRGBO(240, 240, 240, 1),
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(3, 3),
                                    color: Color.fromRGBO(0, 0, 0, 0.2),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-3, -3),
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                  ),
                                ])
                          : BoxDecoration(
                              color: const Color.fromRGBO(25, 25, 25, 1.0),
                              borderRadius: BorderRadius.circular(3),
                              boxShadow: const [
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
                    width: size.width * 0.030,
                  ),
                  AutoSizeText(
                    "Back",
                    textAlign: TextAlign.center,
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
              "Add Music",
              style: TextStyle(
                  color: provider.currentTheme ? dim_black : dim_white,
                  fontFamily: 'Avant',
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            width: (95.0).w,
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
                  hintText: "Search Music",
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: provider.currentTheme ? dim_black : dim_white,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: (4.00).w)),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
            ),
          ),
          SizedBox(height: 1.h,),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Container(
              decoration: provider.currentTheme
                  ? textFormField_neu_morphism
                  : dark_textFormField_neu_morphism,
                  height: 3.8.h,
              child: TabBar(
                  indicator:
                      provider.currentTheme ? indicator_neu_Morphism : indicator_dark_neu_Morphism,
                  labelColor: Colors.deepOrange.shade600,
                  labelStyle: TextStyle(fontWeight: FontWeight.w600,letterSpacing: 0.8),
                  unselectedLabelColor: unselectedLabelColor_custom,

                  controller: tabController,
                  isScrollable: true,
                  labelPadding: EdgeInsets.symmetric(horizontal: 3.w),
                  tabs: const [
                    Tab(
                      child: Text("Trending"),
                    ),
                    Tab(
                      child: Text("Your Sounds"),
                    ),
                    Tab(
                      child: Text("Favorite"),
                    ),
                    Tab(
                      child: Text("Saved"),
                    ),
                  ]),
            ),
          ),
          Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
            TrendingListView(img_url: "asset/music_icons/music_bg.png",),
            YourSoundListView(img_url: "asset/music_icons/music_bg.png",),
            ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    child: Center(
                      child: Text("Favorite"),
                    ),
                  );
                }),
            ListView.builder(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    child: Center(
                      child: Text("Saved"),
                    ),
                  );
                },),
          ],),),
        ],
      ),
    );
  }
}


BoxDecoration indicator_neu_Morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Color.fromRGBO(235, 235, 235, 1),
    boxShadow: const [
      BoxShadow(
        blurRadius: 3,
        offset: Offset(3, 3),
        color: Color.fromRGBO(164, 162, 162, 1.0),
      ),
      BoxShadow(
        blurRadius: 3,
        offset: Offset(-3, -3),
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
    ]);

BoxDecoration indicator_dark_neu_Morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Color.fromRGBO(25, 25, 25, 1.0),
    boxShadow: const [
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
    ]);