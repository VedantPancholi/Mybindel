import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NonFriendPost extends StatefulWidget {
  const NonFriendPost({super.key});

  @override
  State<NonFriendPost> createState() => _NonFriendPostState();
}

class _NonFriendPostState extends State<NonFriendPost> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController commentController;
  FocusNode inputNode = FocusNode();

  bool isFollow = false;
  bool share_clicked = false;
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
        final provider = Provider.of<Themeprovider>(context);
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 2,
      itemBuilder:(context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
                // width: ().w*0.90,
                height: (8.00).h,
                // color: Colors.green,
                color: provider.currentTheme
                    ? light_Scaffold_color
                    : dark_Scaffold_color,
                margin: EdgeInsets.only(left: (3.00).w, right: (1.00).w),
                child: Row(children: [
                  Stack(children: [
                    Container(
                      width: (14.00).w,
                      height: (6.00).h,
                      padding: EdgeInsets.symmetric(
                          vertical: (0.8).h, horizontal: (1.500).w),
                      // color: Colors.black,
                      decoration: provider.currentTheme
                          ? square_neu_Morphism
                          : square_dark_neu_Morphism,
    
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(
                          "asset/images/user_post.png",
                          fit: BoxFit.cover,
                        ),
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
                  SizedBox(
                    width: (2.00).w,
                  ),
                  Stack(
                    children: [
                      Container(
                        width: (77.00).w,
                        height: (7.00).h,
                        // color: Colors.amber,
                        color: provider.currentTheme
                            ? light_Scaffold_color
                            : dark_Scaffold_color,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                height: (7.00).h,
                                width: (35.00).w,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: (2.00).w),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: "Vedant",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: provider.currentTheme
                                                      ? dim_black
                                                      : dim_white),
                                            ),
                                            WidgetSpan(
                                              alignment: PlaceholderAlignment.top,
                                              child: Icon(
                                                Icons.check,
                                                size: 15,
                                                color: orange_color,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      AutoSizeText(
                                        "Artist"
                                            .toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 15, color: orange_color),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                height: (7.00).h,
                                width: (40.00).w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                        width: (10.00).w,
                                        height: (1.800).h,
                                        child: popUpMenuNonFriendPostIndividual((provider)),),
                                    Container(
                                      width: (19.00).w,
                                      height: (3.00).h,
                                      decoration: provider.currentTheme
                                          ? square_neu_Morphism
                                          : square_dark_neu_Morphism,
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            isFollow = !isFollow;
                                          });
                                        },
                                        child: Center(
                                          child: AutoSizeText(
                                              isFollow == true
                                                  ? "Following"
                                                  : "Follow",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: isFollow == true
                                                      ? Colors.deepOrange.shade600
                                                      : provider.currentTheme
                                                          ? dim_black
                                                          : dim_white,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ],
                  )
                ]),
              ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: (3.500).w, vertical: (0.5).h),
            child: AutoSizeText("Created with love, crafted with intelligence."),
          ),

          Container(
          // color: Colors.amber,
          margin: EdgeInsets.all((2.00).w),
          decoration: provider.currentTheme
              ? square_neu_Morphism
              : square_dark_neu_Morphism,
          child: Row(
            children: [
              share_clicked == false
                  ? Container(
                      height: (33.00).h,
                      width: (76.00).w,
                      // color: Colors.amber,
                      margin: EdgeInsets.symmetric(horizontal: (1.00).w),
                      color: provider.currentTheme
                          ? light_Scaffold_color
                          : dark_Scaffold_color,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "asset/images/user_post.png",
                          fit: BoxFit.cover,
                        ),
                      ))
                  : Container(
                      height: (33.00).h,
                      width: (76.00).w,
                      margin: EdgeInsets.symmetric(horizontal: (1.00).w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(
                              "asset/images/user_post.png",
                            ),
                            fit: BoxFit.cover),
                      ),
                      child: ClipRRect(
                        child: BackdropFilter(
                          blendMode: BlendMode.srcOver,
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Stack(
                            children: [
                              // const BlurHash(
                              //     hash: "LXE]Hd|I\$f]C=dxISkr;67KRNsAV"),
                              Container(
                                height: (30.00).h,
                                width: (70.00).w,
                                margin:
                                    EdgeInsets.symmetric(horizontal: (1.00).w),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10)),
                                child: SingleChildScrollView(
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.vertical,
                                  child: Column(children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all((1.50).h),
                                          child: const AutoSizeText(
                                            "Share",
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                          
                                    // 1st Row
                                    SizedBox(
                                      height: (0.50).h,
                                    ),
                          
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: (3).w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: (14.00).w,
                                                height: (6.60).h,
                                                decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    'asset/share_icons/Everyone.svg',
                                                    width: (6.40).w,
                                                    height: (3.30).h,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: (0.25).h,
                                              ),
                                              const AutoSizeText(
                                                "Everyone",
                                                softWrap: true,
                                                wrapWords: true,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: (14.00).w,
                                                height: (6.60).h,
                                                decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    'asset/share_icons/only_with.svg',
                                                    width: (6.40).w,
                                                    height: (3.40).h,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: (0.25).h,
                                              ),
                                              const AutoSizeText(
                                                "Only With",
                                                softWrap: true,
                                                wrapWords: true,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: (14.00).w,
                                                height: (6.60).h,
                                                decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    "asset/share_icons/hide.svg",
                                                    width: (6.40).w,
                                                    height: (3.30).h,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: (0.25).h,
                                              ),
                                              const AutoSizeText(
                                                "Hide From",
                                                softWrap: true,
                                                wrapWords: true,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                          
                                    SizedBox(
                                      height: (1.00).h,
                                    ),
                                    // 2nd Row
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: (3).w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: (14.00).w,
                                                height: (6.60).h,
                                                decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    "asset/share_icons/private.svg",
                                                    width: (6.40).w,
                                                    height: (3.30).h,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: (0.25).h,
                                              ),
                                              const AutoSizeText(
                                                "Private",
                                                softWrap: true,
                                                wrapWords: true,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: (14.00).w,
                                                height: (6.60).h,
                                                decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    "asset/share_icons/Inbox.svg",
                                                    width: (6.40).w,
                                                    height: (3.30).h,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: (0.25).h,
                                              ),
                                              const AutoSizeText(
                                                "Inbox",
                                                softWrap: true,
                                                wrapWords: true,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: (14.00).w,
                                                height: (6.60).h,
                                                decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    "asset/share_icons/copy_link.svg",
                                                    width: (6.40).w,
                                                    height: (3.30).h,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: (0.25).h,
                                              ),
                                              const AutoSizeText(
                                                "Copy With",
                                                softWrap: true,
                                                wrapWords: true,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                          
                                    SizedBox(
                                      height: (1.00).h,
                                    ),
                                    // 3rd Row
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: (3).w),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: (14.00).w,
                                                height: (6.60).h,
                                                decoration: BoxDecoration(
                                                    color: Colors.white
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6)),
                                                child: Center(
                                                  child: SvgPicture.asset(
                                                    "asset/share_icons/outside.svg",
                                                    width: (6.40).w,
                                                    height: (3.0).h,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: (0.25).h,
                                              ),
                                              const AutoSizeText(
                                                "Outside",
                                                softWrap: true,
                                                wrapWords: true,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
              SizedBox(
                width: (1.00).w,
              ),
              Container(
                height: (33.00).h,
                width: (13.00).w,
                // color: Colors.amber,
                padding: EdgeInsets.only(top: (1.500).h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: (8.00).w,
                      height: (8.00).h,
                      // color: Colors.deepOrange,
                      child: GestureDetector(
                        onTap: () {
                          isLiked = !isLiked;
                          setState(() {});
                          print("Star clicked");
                        },
                        child: Column(children: [
                          Image.asset(
                            isLiked
                                ? "asset/images/highlighted_star_in_post.png"
                                : "asset/images/un_highlighted_star_in_post.png",
                            width: (6.00).w,
                          ),
                          AutoSizeText("23"),
                        ]),
                      ),
                    ),
                    // SizedBox(
                    //   width: (8.00).w,
                    //   height: (8.00).h,
                    //   // color: Colors.deepPurple,
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       showModalBottomSheet<void>(
                    //           backgroundColor: provider.currentTheme
                    //               ? light_Scaffold_color
                    //               : dark_Scaffold_color,
                    //           shape: const RoundedRectangleBorder(
                    //               borderRadius: BorderRadius.vertical(
                    //             top: Radius.circular(30.0),
                    //           )),
                    //           elevation: 15,
                    //           constraints: BoxConstraints.loose(
                    //               Size((100).w, (75.00).h)),
                    //           isScrollControlled: true,
                    //           context: context,
                    //           // backgroundColor: Colors.transparent,
                    //           builder: (BuildContext context) {
                    //             return ChangeNotifierProvider(
                    //               create: (context) =>
                    //                   Commenttypeprovider(),
                    //               builder: (context, child) {
                    //                 return GestureDetector(
                    //                   onTap: () {
                    //                     FocusScope.of(context).unfocus();
                    //                   },
                    //                   child: Container(
                    //                     padding: EdgeInsets.only(
                    //                       bottom: MediaQuery.of(context)
                    //                           .viewInsets
                    //                           .bottom,
                    //                     ),
                    //                     height: (70.00).h,
                    //                     child: Consumer(
                    //                       builder: (context,
                    //                           Commenttypeprovider
                    //                               commenttypeprovider,
                    //                           child) {
                    //                         return CommentBox(
                    //                           focusNode: inputNode,
                    //                           userImage: CommentBox
                    //                               .commentImageParser(
                    //                                   imageURLorPath:
                    //                                       "asset/images/user_logo.png"),
                    //                           labelText:
                    //                               'Write a comment...',
                    //                           errorText:
                    //                               'Comment cannot be blank',
                    //                           withBorder: false,
                    //                           sendButtonMethod: () {
                    //                             if (formKey.currentState!
                    //                                 .validate()) {
                    //                               print(commentController
                    //                                   .text);
                    //                               setState(() {
                    //                                 var value = Singelcomment(
                    //                                     picture:
                    //                                         'asset/images/user_logo.png',
                    //                                     name: 'maharshi',
                    //                                     text:
                    //                                         commentController
                    //                                             .text,
                    //                                     datetime:
                    //                                         DateTime.now()
                    //                                             .toString(),
                    //                                     reaction:
                    //                                         Reaction.none,
                    //                                     replies: []);

                    //                                 // if (commenttypeprovider
                    //                                 //     .isreply) {
                    //                                 //   String name = "@" +
                    //                                 //       feeds[widget
                    //                                 //               .postIndex]
                    //                                 //           .comments[
                    //                                 //               commenttypeprovider
                    //                                 //                   .pushIndex]
                    //                                 //           .name;
                    //                                 //   value.text =
                    //                                 //       "$name ${value.text}";
                    //                                 //   feeds[widget
                    //                                 //           .postIndex]
                    //                                 //       .comments[
                    //                                 //           commenttypeprovider
                    //                                 //               .getPushIndex]
                    //                                 //       .replies
                    //                                 //       .add(value);
                    //                                 //   commenttypeprovider
                    //                                 //           .changecommentType =
                    //                                 //       false;
                    //                                 // } else {
                    //                                 //   feeds[widget
                    //                                 //           .postIndex]
                    //                                 //       .comments
                    //                                 //       .add(value);
                    //                                 // }
                    //                               });

                    //                               commentController.clear();
                    //                               FocusScope.of(context)
                    //                                   .unfocus();
                    //                             } else {
                    //                               print("Not validated");
                    //                             }
                    //                           },
                    //                           formKey: formKey,
                    //                           commentController:
                    //                               commentController,
                    //                           backgroundColor:
                    //                               provider.currentTheme
                    //                                   ? light_Scaffold_color
                    //                                   : dark_Scaffold_color,
                    //                           textColor:
                    //                               provider.currentTheme
                    //                                   ? dim_black
                    //                                   : dim_white,
                    //                           sendWidget: Icon(
                    //                               Icons.send_sharp,
                    //                               size: 30,
                    //                               color: orange_color),
                    //                           child: Container(
                    //                             height: (100.00).h,
                    //                             width: (100).w,
                    //                             //color: Colors.red,
                    //                             child: Padding(
                    //                                 padding:
                    //                                     const EdgeInsets
                    //                                         .only(top: 20),
                    //                                 child: commentChild(
                    //                                     feeds[widget
                    //                                             .postIndex]
                    //                                         .comments,
                    //                                     context,
                    //                                     inputNode,
                    //                                     widget.postIndex
                    //                                     )),
                    //                           ),
                    //                         );
                    //                       },
                    //                     ),
                    //                   ),
                    //                 );
                    //               },
                    //             );
                    //           });
                    //     },
                    //     child: Column(children: [
                    //       Image.asset(
                    //         "asset/images/comment_in_post.png",
                    //         width: (6.00).w,
                    //       ),
                    //       AutoSizeText(feeds[widget.postIndex]
                    //           .comments
                    //           .length
                    //           .toString()),
                    //     ]),
                    //   ),
                    // ),
                    Container(
                      width: (8.00).w,
                      height: (8.00).h,
                      // color: Colors.deepOrange,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            share_clicked = !share_clicked;
                          });

                          print("Share clicked");
                        },
                        child: Column(children: [
                          Image.asset(
                            "asset/images/share_in_post.png",
                            width: (6.00).w,
                          ),
                          AutoSizeText(
                            "20"
                            // feeds[widget.postIndex]
                            //   .sharesCount
                            //   .toString()
                              ),
                        ]),
                      ),
                    ),
                    Container(
                      width: (6.00).w,
                      height: (4.00).h,
                      // color: Colors.deepPurple,
                      child: GestureDetector(
                        onTap: () {
                          print("Download cliked");
                        },
                        child: Image.asset(
                          "asset/images/download_in_post.png",
                          width: (6.00).w,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

          Container(
              width: (93.5).w,
              height: (2.500).h,
              // color: Colors.red,
              color: provider.currentTheme
                  ? light_Scaffold_color
                  : dark_Scaffold_color,
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "100", 
                      // feeds[widget.postIndex].views,
                      style: TextStyle(
                        fontSize: 10,
                        color: provider.currentTheme
                            ? dark_Scaffold_color
                            : light_Scaffold_color,
                      ),
                    ),
                    TextSpan(
                      text: "views",
                      style: TextStyle(
                        fontSize: 10,
                        color: provider.currentTheme
                            ? dark_Scaffold_color
                            : light_Scaffold_color,
                      ),
                    ),
                  ],
                ),
              ),
            )
        ],
        );
     },
    );
  }
}

Widget popUpMenuNonFriendPostIndividual(provider) {
  return PopupMenuButton(
    onOpened: () {},
    onCanceled: () {},
    color: provider.currentTheme
        ? light_Scaffold_color
        : dark_Scaffold_color, //Color.fromRGBO(204, 204, 204, 0.4),
    padding: const EdgeInsets.all(0),
    constraints: BoxConstraints.expand(width: (44.1).w, height: (29.01).h),
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
                height: (4.55).h,
                width: (9.0).w,
                decoration: BoxDecoration(
                    color: provider.currentTheme
                        ? light_Scaffold_color
                        : dark_Scaffold_color,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(
                  Icons.disabled_visible_outlined,
                  color: Color.fromRGBO(93, 93, 93, 1),
                  size: 24,
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.yellow,
                  child: const Center(
                    child: Text(
                      'Hide',
                      style: TextStyle(
                          color: Color.fromRGBO(93, 93, 93, 1),
                          fontSize: 13,
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
                height: (4.55).h,
                width: (9.0).w,
                decoration: BoxDecoration(
                    color: provider.currentTheme
                        ? light_Scaffold_color
                        : dark_Scaffold_color,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(
                  Icons.person,
                  color: Color.fromRGBO(93, 93, 93, 1),
                  size: 26,
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.yellow,
                  child: const Center(
                    child: Text(
                      'View Profile',
                      style: TextStyle(
                          color: Color.fromRGBO(93, 93, 93, 1),
                          fontSize: 13,
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
                height: (4.55).h,
                width: (9.0).w,
                decoration: BoxDecoration(
                    color: provider.currentTheme
                        ? light_Scaffold_color
                        : dark_Scaffold_color,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(
                  Icons.mobile_off_rounded,
                  color: Color.fromRGBO(93, 93, 93, 1),
                  size: 26,
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.yellow,
                  child: const Center(
                    child: Text(
                      'Mute',
                      style: TextStyle(
                          color: Color.fromRGBO(93, 93, 93, 1),
                          fontSize: 13,
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
                height: (4.55).h,
                width: (9.0).w,
                decoration: BoxDecoration(
                    color: provider.currentTheme
                        ? light_Scaffold_color
                        : dark_Scaffold_color,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(
                  Icons.message,
                  color: Color.fromRGBO(93, 93, 93, 1),
                  size: 26,
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.yellow,
                  child: const Center(
                    child: Text(
                      'Message',
                      style: TextStyle(
                          color: Color.fromRGBO(93, 93, 93, 1),
                          fontSize: 13,
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
                height: (4.55).h,
                width: (9.0).w,
                decoration: BoxDecoration(
                    color: provider.currentTheme
                        ? light_Scaffold_color
                        : dark_Scaffold_color,
                    borderRadius: BorderRadius.circular(5)),
                child: const Icon(
                  Icons.report,
                  color: Color.fromRGBO(93, 93, 93, 1),
                  size: 26,
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.yellow,
                  child: const Center(
                    child: Text(
                      'Report',
                      style: TextStyle(
                          color: Color.fromRGBO(93, 93, 93, 1),
                          fontSize: 13,
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