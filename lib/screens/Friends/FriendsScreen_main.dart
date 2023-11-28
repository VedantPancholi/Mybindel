
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Dummy_Data/Dummy_friendrequest.dart';
import '../../models/FriendRequest.dart';
import '../../palette/palette.dart';
import '../../providers/selectTheme.dart';
import 'package:sizer/sizer.dart';

import 'BlockedFriend.dart';
import 'FriendTabBar.dart';
import 'MutedFriends.dart';

class FriendsScreen_main extends StatefulWidget {
  const FriendsScreen_main({super.key});

  @override
  State<FriendsScreen_main> createState() => _FmainState();
}

class _FmainState extends State<FriendsScreen_main> with SingleTickerProviderStateMixin {
  late PageController pageController;
  late AnimationController animeController;

  @override
  void initState() {
    animeController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    animeController.forward();
    pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    animeController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor:
      provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: FadeTransition(
                opacity: animeController,
                child: Container(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: pageController,
                    children: [
                      FriendsPage1(animecontroller: animeController,pageController: pageController,),
                      FriendsPage2(animecontroller: animeController,pageController: pageController,),
                      FriendsPage3(animecontroller: animeController,pageController: pageController,)
                    ],
                  ),
                ),
              ),
              //color: Colors.red,
              // child: PageView.builder(
              //   physics: NeverScrollableScrollPhysics(),
              //     controller: pageController,
              //     itemCount: pages.length,
              //     itemBuilder: (context, index) {
              //       return FadeTransition(
              //         opacity: animeController,
              //         child: pages[index],
              //       );
              //     }),
            ),
          ),
        ],
      ),
    );
  }
}


class FriendsPage1 extends StatefulWidget {
  AnimationController animecontroller;
  PageController pageController;
  FriendsPage1({required this.animecontroller ,required this.pageController});

  @override
  State<FriendsPage1> createState() => _FriendsPage1State();
}

class _FriendsPage1State extends State<FriendsPage1> with TickerProviderStateMixin{
  late TabController tabController ;
  Color unselectedLabelColor_custom = Colors.grey.shade600;

  @override
  void initState() {

    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  String changeHinttext(index) {
    switch (index) {
      case 0:
        return 'Search in Friends';
      case 1:
        return 'Search in Muted friends';
      case 2:
        return 'Search in Blocked friends';
      default:
        return 'Search in friends';
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);

    return Column(
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
                onTap: () {},
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: changeHinttext(tabController.index),
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color:
                      provider.currentTheme ? dim_black : dim_white,
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: (4.00).w)),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
              ),
            ),
            GestureDetector(
              onTap: () {
                widget.animecontroller.reset();
                widget.animecontroller.forward();
                widget.pageController.jumpToPage(1);
              },
              child: Container(
                width: (12.00).w,
                height: (5).h,
                margin: EdgeInsets.only(
                  // vertical: ().h * 0.010,
                  right: (4.00).w,
                  left: (1.50).w,
                ),
                decoration: provider.currentTheme
                    ? square_neu_Morphism
                    : square_dark_neu_Morphism,
                child: Center(
                    child: SvgPicture.asset(
                      'asset/Friends_icons/viewRequest_icon.svg',
                      height: (3.1).h,
                    )),
              ),
            ),
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
                "Friends",
                style: TextStyle(
                    color:
                    provider.currentTheme ? dim_black : dim_white,
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
                    labelStyle: const TextStyle(
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
                MutedFriends(),
                BlockFriends(),
              ],
            ))
      ],
    );
  }
}

class FriendsPage2 extends StatefulWidget {
  AnimationController animecontroller;
  PageController pageController;
  FriendsPage2({required this.animecontroller ,required this.pageController});

  @override
  State<FriendsPage2> createState() => _FriendsPage2State();
}

class _FriendsPage2State extends State<FriendsPage2> {
  late final friendRequestObject;
  List<FriendRequest> accepted = [];
  List<FriendRequest> deleted = [];
  List<FriendRequest> sendrequest = [];
  List<FriendRequest> hidesuggesion = [];

  @override
  void initState() {
    friendRequestObject = getfriendRequestobj();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final friendRequest = friendRequestObject.getfriendRequest;
    final suggestion = friendRequestObject.getsuggestion;

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
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
                    onTap: () {
                      widget.animecontroller.reset();
                      widget.animecontroller.forward();
                      widget.pageController.jumpToPage(2);
                    },
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Find More Friends",
                        hintStyle: TextStyle(
                          fontSize: 15,
                          color: provider.currentTheme
                              ? dim_black
                              : dim_white,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: (4.00).w)),
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                InkWell(
                  onTap: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    widget.animecontroller.reset();
                    widget.animecontroller.forward();
                    widget.pageController.jumpToPage(0);
                  },
                  child: Container(
                    width: (12.00).w,
                    height: (5).h,
                    margin: EdgeInsets.only(
                      // vertical: ().h * 0.010,
                      right: (4.00).w,
                      left: (1.50).w,
                    ),
                    decoration: provider.currentTheme
                        ? square_neu_Morphism
                        : square_dark_neu_Morphism,
                    child: Center(
                        child: SvgPicture.asset(
                          'asset/Friends_icons/selectedviewRequest.svg',
                          height: (3.1).h,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: (69.00).h,
            width: (100).w,
            //color: Colors.red,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Visibility(
                    visible:
                    friendRequest.length > 0 ? true : false,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 4.h,
                      // color: Colors.amber,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      child: const AutoSizeText(
                        "Friend Requests",
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(93, 93, 93, 1)),
                      ),
                    ),
                  ),
                  Container(
                    //height: (42).h,
                    // color: Colors.red,
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              vertical: (0.8).h),
                          physics:
                          const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: friendRequest.length,
                          itemBuilder: (context, requestIndex) {
                            return Container(
                              //color: Colors.amber,
                              height: (12.96).h,
                              width: (100).w,
                              margin: EdgeInsets.symmetric(
                                  horizontal: (4.1).w),
                              child: Row(
                                children: [
                                  Stack(children: [
                                    Container(
                                      width: (25.00).w,
                                      height: (11.00).h,
                                      padding: EdgeInsets.symmetric(
                                          vertical: (0.8).h,
                                          horizontal: (1.500).w),
                                      // color: Colors.black,
                                      decoration: provider
                                          .currentTheme
                                          ? square_neu_Morphism
                                          : square_dark_neu_Morphism,

                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(
                                            12),
                                        child: Image.asset(
                                            friendRequest[
                                            requestIndex]
                                                .picture),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(
                                            40),
                                        child: Container(
                                          //color: Colors.red,
                                          width: (2.800).w,
                                          height: (1.400).h,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    width: (1).w,
                                  ),
                                  Container(
                                    //color: Colors.pink,
                                    width: (65).w,
                                    height: (11.00).h,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: (65.00).w,
                                          height: (2.500).h,
                                          padding: EdgeInsets.only(
                                              left: (2).w),
                                          color: provider
                                              .currentTheme
                                              ? light_Scaffold_color
                                              : dark_Scaffold_color,
                                          child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .center,
                                              children: [
                                                Container(
                                                  alignment:
                                                  Alignment
                                                      .topLeft,
                                                  width: (33.00).w,
                                                  height: (2.500).h,
                                                  //color: Colors.cyan,
                                                  child: RichText(
                                                    text: TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: friendRequest[
                                                          requestIndex]
                                                              .name,
                                                          style: TextStyle(
                                                              fontSize:
                                                              16,
                                                              color: provider.currentTheme
                                                                  ? dim_black
                                                                  : dim_white),
                                                        ),
                                                        WidgetSpan(
                                                          alignment:
                                                          PlaceholderAlignment
                                                              .top,
                                                          child:
                                                          Icon(
                                                            Icons
                                                                .check,
                                                            size:
                                                            15,
                                                            color:
                                                            orange_color,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  friendRequest[
                                                  requestIndex]
                                                      .duration,
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                      FontWeight
                                                          .w500,
                                                      color: Color
                                                          .fromRGBO(
                                                          144,
                                                          144,
                                                          144,
                                                          1)),
                                                )
                                              ]),
                                        ),
                                        Container(
                                          //color: Colors.blue,
                                          width: (65.00).w,
                                          height: (2.500).h,
                                          padding: EdgeInsets.only(
                                              left: (2).w),
                                          alignment:
                                          Alignment.centerLeft,
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .center,
                                            children: [
                                              AutoSizeText(
                                                friendRequest[
                                                requestIndex]
                                                    .occupation
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    letterSpacing:
                                                    0.4,
                                                    fontWeight:
                                                    FontWeight
                                                        .w600,
                                                    fontSize: 12,
                                                    color:
                                                    orange_color),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          //color: Colors.green,
                                          width: (65.00).w,
                                          height: (2.500).h,
                                          padding: EdgeInsets.only(
                                              left: (2).w),
                                          alignment:
                                          Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                "${friendRequest[requestIndex].mutualfriends.toString()} Mutual Friend",
                                                textAlign:
                                                TextAlign.start,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight
                                                        .w500,
                                                    letterSpacing:
                                                    0.7,
                                                    color: Color
                                                        .fromRGBO(
                                                        93,
                                                        93,
                                                        93,
                                                        1)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          //color: Colors.brown,
                                          width: (65).w,
                                          height: (3.500).h,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  accepted.add(
                                                      friendRequest[
                                                      requestIndex]);
                                                  friendRequestobj
                                                      .removefriendrequest(
                                                      requestIndex);
                                                  var snackdemo =
                                                  SnackBar(
                                                    margin: EdgeInsets.only(
                                                        left: (3).w,
                                                        right:
                                                        (3).w,
                                                        bottom:
                                                        (10).h),
                                                    duration:
                                                    const Duration(
                                                        seconds:
                                                        1),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                    content: const Text(
                                                        '1 Request Accepted'),
                                                    backgroundColor: Colors
                                                        .transparent
                                                        .withOpacity(
                                                        0.7),
                                                    elevation: 10,
                                                    behavior:
                                                    SnackBarBehavior
                                                        .floating,
                                                  );
                                                  ScaffoldMessenger
                                                      .of(
                                                      context)
                                                      .showSnackBar(
                                                      snackdemo);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  width: (31.28).w,
                                                  height: (3.31).h,
                                                  alignment:
                                                  Alignment
                                                      .center,
                                                  padding: EdgeInsets
                                                      .symmetric(
                                                      horizontal:
                                                      4.w,
                                                      vertical:
                                                      (0.5)
                                                          .h),
                                                  decoration: provider
                                                      .currentTheme
                                                      ? square_neu_Morphism
                                                      : square_dark_neu_Morphism,
                                                  child: Text(
                                                    "Accept",
                                                    style: TextStyle(
                                                        color:
                                                        orange_color,
                                                        fontSize:
                                                        12,
                                                        letterSpacing:
                                                        1,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  deleted.add(
                                                      friendRequest[
                                                      requestIndex]);
                                                  friendRequestobj
                                                      .removefriendrequest(
                                                      requestIndex);
                                                  var snackdemo =
                                                  SnackBar(
                                                    margin: EdgeInsets.only(
                                                        left: (3).w,
                                                        right:
                                                        (3).w,
                                                        bottom:
                                                        (10).h),
                                                    duration:
                                                    const Duration(
                                                        seconds:
                                                        1),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                    content: const Text(
                                                        '1 Request Deleted'),
                                                    backgroundColor: Colors
                                                        .transparent
                                                        .withOpacity(
                                                        0.7),
                                                    elevation: 10,
                                                    behavior:
                                                    SnackBarBehavior
                                                        .floating,
                                                  );
                                                  ScaffoldMessenger
                                                      .of(
                                                      context)
                                                      .showSnackBar(
                                                      snackdemo);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: (3.31).h,
                                                  width: (21.28).w,
                                                  padding: EdgeInsets
                                                      .symmetric(
                                                      horizontal:
                                                      4.w,
                                                      vertical:
                                                      (0.5)
                                                          .h),
                                                  alignment:
                                                  Alignment
                                                      .center,
                                                  decoration: provider
                                                      .currentTheme
                                                      ? square_neu_Morphism
                                                      : square_dark_neu_Morphism,
                                                  child: const Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                        color: Color
                                                            .fromRGBO(
                                                            93,
                                                            93,
                                                            93,
                                                            1),
                                                        letterSpacing:
                                                        1,
                                                        fontSize:
                                                        12,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: (7.18).w,
                                                height: (3.31).h,
                                                decoration: provider
                                                    .currentTheme
                                                    ? square_neu_Morphism
                                                    : square_dark_neu_Morphism,
                                                child: popupbutton(provider),)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          })),
                  Visibility(
                    visible: suggestion.length > 0 ? true : false,
                    maintainAnimation: true,
                    maintainState: true,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 4.h,
                      // color: Colors.amber,
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      child: const AutoSizeText(
                        "You might know",
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                            color: Color.fromRGBO(93, 93, 93, 1)),
                      ),
                    ),
                  ),
                  Container(
                    //height: (42).h,
                    // color: Colors.red,
                      child: ListView.builder(
                          padding: EdgeInsets.symmetric(
                              vertical: (0.8).h),
                          physics:
                          const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: suggestion.length,
                          itemBuilder: (context, suggestionIndex) {
                            return Container(
                              //color: Colors.amber,
                              height: (12.96).h,
                              width: (100).w,
                              margin: EdgeInsets.symmetric(
                                  horizontal: (4.1).w),
                              child: Row(
                                children: [
                                  Stack(children: [
                                    Container(
                                      width: (25.00).w,
                                      height: (11.00).h,
                                      padding: EdgeInsets.symmetric(
                                          vertical: (0.8).h,
                                          horizontal: (1.500).w),
                                      // color: Colors.black,
                                      decoration: provider
                                          .currentTheme
                                          ? square_neu_Morphism
                                          : square_dark_neu_Morphism,

                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(
                                            12),
                                        child: Image.asset(
                                            suggestion[
                                            suggestionIndex]
                                                .picture),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(
                                            40),
                                        child: Container(
                                          //color: Colors.red,
                                          width: (2.800).w,
                                          height: (1.400).h,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  SizedBox(
                                    width: (1).w,
                                  ),
                                  Container(
                                    //color: Colors.pink,
                                    width: (65).w,
                                    height: (11.00).h,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: (65.00).w,
                                          height: (2.500).h,
                                          padding: EdgeInsets.only(
                                              left: (2).w),
                                          color: provider
                                              .currentTheme
                                              ? light_Scaffold_color
                                              : dark_Scaffold_color,
                                          child: Container(
                                            alignment:
                                            Alignment.topLeft,
                                            width: (33.00).w,
                                            height: (2.500).h,
                                            //color: Colors.cyan,
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: suggestion[
                                                    suggestionIndex]
                                                        .name,
                                                    style: TextStyle(
                                                        fontSize:
                                                        16,
                                                        color: provider
                                                            .currentTheme
                                                            ? dim_black
                                                            : dim_white),
                                                  ),
                                                  WidgetSpan(
                                                    alignment:
                                                    PlaceholderAlignment
                                                        .top,
                                                    child: Icon(
                                                      Icons.check,
                                                      size: 15,
                                                      color:
                                                      orange_color,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          //color: Colors.blue,
                                          width: (65.00).w,
                                          height: (2.500).h,
                                          padding: EdgeInsets.only(
                                              left: (2).w),
                                          alignment:
                                          Alignment.centerLeft,
                                          child: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .center,
                                            children: [
                                              AutoSizeText(
                                                suggestion[
                                                suggestionIndex]
                                                    .occupation
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    letterSpacing:
                                                    0.4,
                                                    fontWeight:
                                                    FontWeight
                                                        .w600,
                                                    fontSize: 12,
                                                    color:
                                                    orange_color),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          //color: Colors.green,
                                          width: (65.00).w,
                                          height: (2.500).h,
                                          padding: EdgeInsets.only(
                                              left: (2).w),
                                          alignment:
                                          Alignment.centerLeft,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .start,
                                            children: [
                                              Text(
                                                "${suggestion[suggestionIndex].mutualfriends}. Mutual Friend",
                                                textAlign:
                                                TextAlign.start,
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                    FontWeight
                                                        .w500,
                                                    letterSpacing:
                                                    0.7,
                                                    color: Color
                                                        .fromRGBO(
                                                        93,
                                                        93,
                                                        93,
                                                        1)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          //color: Colors.brown,
                                          width: (65).w,
                                          height: (3.500).h,
                                          child: Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceAround,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  sendrequest.add(
                                                      suggestion[
                                                      suggestionIndex]);
                                                  friendRequestobj
                                                      .removesuggestion(
                                                      suggestionIndex);
                                                  var snackdemo =
                                                  SnackBar(
                                                    margin: EdgeInsets.only(
                                                        left: (3).w,
                                                        right:
                                                        (3).w,
                                                        bottom:
                                                        (10).h),
                                                    duration:
                                                    const Duration(
                                                        seconds:
                                                        1),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                    content: const Text(
                                                        'Send Request'),
                                                    backgroundColor: Colors
                                                        .transparent
                                                        .withOpacity(
                                                        0.7),
                                                    elevation: 10,
                                                    behavior:
                                                    SnackBarBehavior
                                                        .floating,
                                                  );
                                                  ScaffoldMessenger
                                                      .of(
                                                      context)
                                                      .showSnackBar(
                                                      snackdemo);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  width: (31.28).w,
                                                  height: (3.31).h,
                                                  alignment:
                                                  Alignment
                                                      .center,
                                                  padding: EdgeInsets
                                                      .symmetric(
                                                      horizontal:
                                                      4.w,
                                                      vertical:
                                                      (0.5)
                                                          .h),
                                                  decoration: provider
                                                      .currentTheme
                                                      ? square_neu_Morphism
                                                      : square_dark_neu_Morphism,
                                                  child: Text(
                                                    "Send Request",
                                                    style: TextStyle(
                                                        color:
                                                        orange_color,
                                                        fontSize:
                                                        12,
                                                        letterSpacing:
                                                        1,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  hidesuggesion.add(
                                                      suggestion[
                                                      suggestionIndex]);
                                                  friendRequestobj
                                                      .removesuggestion(
                                                      suggestionIndex);
                                                  var snackdemo =
                                                  SnackBar(
                                                    margin: EdgeInsets.only(
                                                        left: (3).w,
                                                        right:
                                                        (3).w,
                                                        bottom:
                                                        (10).h),
                                                    duration:
                                                    const Duration(
                                                        seconds:
                                                        1),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                    content: const Text(
                                                        '1 Suggestion hide'),
                                                    backgroundColor: Colors
                                                        .transparent
                                                        .withOpacity(
                                                        0.7),
                                                    elevation: 10,
                                                    behavior:
                                                    SnackBarBehavior
                                                        .floating,
                                                  );
                                                  ScaffoldMessenger
                                                      .of(
                                                      context)
                                                      .showSnackBar(
                                                      snackdemo);
                                                  setState(() {});
                                                },
                                                child: Container(
                                                  height: (3.31).h,
                                                  width: (21.28).w,
                                                  padding: EdgeInsets
                                                      .symmetric(
                                                      horizontal:
                                                      4.w,
                                                      vertical:
                                                      (0.5)
                                                          .h),
                                                  alignment:
                                                  Alignment
                                                      .center,
                                                  decoration: provider
                                                      .currentTheme
                                                      ? square_neu_Morphism
                                                      : square_dark_neu_Morphism,
                                                  child: const Text(
                                                    "Hide",
                                                    style: TextStyle(
                                                        color: Color
                                                            .fromRGBO(
                                                            93,
                                                            93,
                                                            93,
                                                            1),
                                                        letterSpacing:
                                                        1,
                                                        fontSize:
                                                        12,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  width: (7.18).w,
                                                  height: (3.31).h,
                                                  decoration: provider
                                                      .currentTheme
                                                      ? square_neu_Morphism
                                                      : square_dark_neu_Morphism,
                                                  child:popupbutton(provider)
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          })),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FriendsPage3 extends StatefulWidget {
  AnimationController animecontroller;
  PageController pageController;
  FriendsPage3({required this.animecontroller ,required this.pageController});

  @override
  State<FriendsPage3> createState() => _FriendsPage3State();
}

class _FriendsPage3State extends State<FriendsPage3> {
  bool issearched = false;
  List<String> searchedfriends = [];
  late final friendRequestObject;

  Widget getSearch(int index) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: (0.2).h),
      child: ListTile(
        onTap: () {},
        title: Row(
          children: [
            Container(
              width: (10.0).w,
              child: const Icon(Icons.history),
            ),
            Container(
              width: (67.5).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    searchedfriends[index],
                    style: const TextStyle(
                        fontWeight: FontWeight.w300, fontSize: 17),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          searchedfriends.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.close)),
                ],
              ),
            ),
          ],
        ),
        // trailing: IconButton(
        //     onPressed: () {
        //       setState(() {
        //       search.removeAt(index);
        //       });
        //     },
        //     icon: Icon(Icons.close)),
        // leading: Icon(Icons.history),
      ),
    );
  }

  void setSearches() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList('searchedfriends', searchedfriends);
  }
  void getSearches() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    searchedfriends = await sharedPreferences.getStringList('searchedfriends') ?? [];
    setState(() {});
  }


  @override
  void initState(){
    friendRequestObject = getfriendRequestobj();
    getSearches();
    super.initState();
  }

  @override
  void deactivate() {
    setSearches();
    super.deactivate();
  }


  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormFieldState>();
    final suggestion = friendRequestObject.getsuggestion;
    FocusNode mynode = FocusNode();
    // mynode.requestFocus();
    final provider = Provider.of<Themeprovider>(context);
    TextEditingController _findfriendController = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 3.0.w, vertical: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  width: (8.0).w,
                  height: (4.0).h,
                  margin: EdgeInsets.only(bottom: (0.50).h),
                  decoration: provider.currentTheme
                      ? BoxDecoration(
                      color: const Color.fromRGBO(
                          240, 240, 240, 1),
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
                          color: Color.fromRGBO(
                              255, 255, 255, 1.0),
                        ),
                      ])
                      : BoxDecoration(
                      color:
                      const Color.fromRGBO(25, 25, 25, 1.0),
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(5, 5),
                          color:
                          Color.fromRGBO(18, 18, 18, 1.0),
                        ),
                        BoxShadow(
                          blurRadius: 3,
                          offset: Offset(-3, -5),
                          color:
                          Color.fromRGBO(33, 33, 33, 1.0),
                        ),
                      ]),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 17,
                      color: orange_color,
                    ),
                    onPressed: () {
                      setSearches();
                      widget.animecontroller.reset();
                      widget.animecontroller.forward();
                      widget.pageController.jumpToPage(1);
                    },
                  )),
              SizedBox(
                width: (3.0).w,
              ),
              Container(
                width: (70.0).w,
                height: (5.0).h,
                decoration: provider.currentTheme
                    ? textFormField_neu_morphism
                    : dark_textFormField_neu_morphism,
                child: TextFormField(
                  key: _key,
                  autocorrect: true,
                  autofocus: true,
                  focusNode: mynode,
                  controller: _findfriendController,
                  onChanged: (val){
                    print(val);
                    if (val.isNotEmpty && issearched == false){
                      issearched = true;
                      setState(() {});
                    }
                    if(val.isEmpty && issearched == true)
                    {
                      issearched = false;
                      setState(() {});
                    }

                    print(_key.currentState?.value);

                    // if(val.isNotEmpty)
                    //   {suggestion.where((suggestion) => suggestion.contains(val)).toList();
                    //   }

                  },
                  onFieldSubmitted: (val) {
                    String name = _findfriendController.text.trim();
                    if (name.isNotEmpty) {
                      _findfriendController.text = "";
                      searchedfriends.add(name);
                    }
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Find More Friends",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: provider.currentTheme
                            ? dim_black
                            : dim_white,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: (4.00).w)),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
              ),
              SizedBox(
                width: (3.0).w,
              ),
              Container(
                  width: (9.0).w,
                  height: (4.0).h,
                  decoration: provider.currentTheme
                      ? BoxDecoration(
                      color: const Color.fromRGBO(
                          240, 240, 240, 1),
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
                          color: Color.fromRGBO(
                              255, 255, 255, 1.0),
                        ),
                      ])
                      : BoxDecoration(
                      color:
                      const Color.fromRGBO(25, 25, 25, 1.0),
                      borderRadius: BorderRadius.circular(3),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 5,
                          offset: Offset(5, 5),
                          color:
                          Color.fromRGBO(18, 18, 18, 1.0),
                        ),
                        BoxShadow(
                          blurRadius: 3,
                          offset: Offset(-3, -5),
                          color:
                          Color.fromRGBO(33, 33, 33, 1.0),
                        ),
                      ]),
                  child: Center(
                      child: IconButton(
                        onPressed: () {
                          // storing the names
                          String name = _findfriendController.text.trim();
                          if (name.isNotEmpty) {
                            _findfriendController.text = "";
                            searchedfriends.add(name);
                            //setState(() {});
                          }
                        },
                        icon: const Icon(
                          Icons.history,
                          size: 18,
                        ),
                        color: orange_color,
                      ))),
            ],
          ),
        ),
        issearched
            ?
        Expanded(
          child: ListView.builder(
              itemCount: suggestion.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {},
                  child: Container(
                    height: (8).h,
                    width: (90).w,
                    margin: EdgeInsets.only(
                        right: 4.5.w,
                        bottom: 1.2.h,
                        top: 0.5.h,
                        left: 4.4.w),
                    alignment: Alignment.centerLeft,
                    decoration: provider.currentTheme
                        ? square_neu_Morphism
                        : square_dark_neu_Morphism,
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: (0.8).h,
                                  horizontal: (2.2).w),
                              child: Container(
                                width: (12.0).w,
                                height: (6.0).h,
                                // decoration: square_neu_Morphism,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(
                                      5),
                                  child: Image.asset(
                                    suggestion[index].picture,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: suggestion[index].name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            letterSpacing:
                                            1.2,
                                            fontWeight:
                                            FontWeight
                                                .w500,
                                            color: provider
                                                .currentTheme
                                                ? dim_black
                                                : dim_white),
                                      ),
                                      WidgetSpan(
                                        alignment:
                                        PlaceholderAlignment
                                            .top,
                                        child: Container(
                                            width: 4.2.w,
                                            height: 2.0.h,
                                            alignment:
                                            Alignment
                                                .topCenter,
                                            margin: EdgeInsets
                                                .only(
                                                bottom:
                                                0.5.h,
                                                left: 1.2
                                                    .w),
                                            child: Image.asset(
                                                "asset/images/check.png")),
                                      ),
                                    ],
                                  ),
                                ),
                                AutoSizeText(
                                  suggestion[index].occupation,
                                  style: TextStyle(
                                      color: orange_color,
                                      fontWeight:
                                      FontWeight.w500,
                                      fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          //color: Colors.brown,
                          width: (40).w,
                          height: (3.500).h,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: (3.31).h,
                                  width: (26.28).w,
                                  padding:
                                  EdgeInsets.symmetric(
                                      horizontal: 4.w,
                                      vertical: (0.5).h),
                                  alignment: Alignment.center,
                                  decoration: provider
                                      .currentTheme
                                      ? square_neu_Morphism
                                      : square_dark_neu_Morphism,
                                  child: const Text(
                                    "Add Friend",
                                    style: TextStyle(
                                        color: Color.fromRGBO(
                                            93, 93, 93, 1),
                                        letterSpacing: 1,
                                        fontSize: 12,
                                        fontWeight:
                                        FontWeight.bold),
                                  ),
                                ),
                              ),
                              Container(
                                  width: (7.18).w,
                                  height: (3.31).h,
                                  decoration: provider
                                      .currentTheme
                                      ? square_neu_Morphism
                                      : square_dark_neu_Morphism,
                                  child:
                                  popupbutton(provider)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
        )
            : Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: searchedfriends.length,
              itemBuilder: (context, index) => getSearch(index)),
        )
      ],
    );
  }
}


Widget popupbutton(provider) {
  return PopupMenuButton(
    onOpened: () {},
    onCanceled: () {},
    color: provider.currentTheme
        ? light_Scaffold_color
        : dark_Scaffold_color, //Color.fromRGBO(204, 204, 204, 0.4),
    padding: const EdgeInsets.all(0),
    constraints: BoxConstraints.expand(width: (44.1).w, height: (23.41).h),
    position: PopupMenuPosition.over,
    offset: const Offset(-50, 0),
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
                  child: const Center(
                    child: Text(
                      'View Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
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
                  child: SvgPicture.asset("asset/friend_nonFriend_screen_icon/BlockMessagesIcon.svg")
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: (2.2).w),
                  alignment: Alignment.centerLeft,
                  // color: Colors.yellow,
                  child: const Center(
                    child: Text(
                      'Block Messages',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
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
                  child: const Center(
                    child: Text(
                      'Block Person',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
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
                  child: SvgPicture.asset("asset/friend_nonFriend_screen_icon/Report.svg")
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: (2.2).w),
                  alignment: Alignment.centerLeft,
                  // color: Colors.yellow,
                  child: const Center(
                    child: Text(
                      'Report',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
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
