import 'package:auto_size_text/auto_size_text.dart';
import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../palette/palette.dart';
import '../../providers/selectTheme.dart';

class single_item extends StatefulWidget {
  @override
  State<single_item> createState() => _single_itemState();
}

class _single_itemState extends State<single_item> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();

  static String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  // print(dateStr);
  static String currentTime = DateFormat('hh:mm a').format(DateTime.now());

  // late FocusNode myFocusNode;
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   myFocusNode = FocusNode();
  // }
  //
  // @override
  // void dispose() {
  //   // Clean up the focus node when the Form is disposed.
  //   myFocusNode.dispose();
  //
  //   super.dispose();
  // }

  List filedata = [
    {
      'name': 'Chuks Okwuenu',
      'pic': 'asset/images/emily.png',
      'message': 'I love to code',
      'date': '2021-01-01 11:00 AM'
    },
    {
      'name': 'Biggi Man',
      'pic': 'asset/images/franklin.png',
      'message': 'Very cool',
      'date': '2021-01-01 08:00 PM'
    },
    {
      'name': 'Tunde Martins',
      'pic': 'asset/images/marshall.png',
      'message': 'Very cool',
      'date': '2021-01-01 01:00 AM'
    },
    {
      'name': 'Biggi Man',
      'pic': 'asset/images/user_post.png',
      'message': 'Very cool',
      'date': '2021-01-01 10:00 PM'
    },
  ];


  Widget commentChild(data) {
    return ListView.builder(
        itemCount: filedata.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked ${index}");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: CommentBox.commentImageParser(
                          imageURLorPath: data[index]['pic'])),
                ),
              ),
              title: Text(
                data[index]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[index]['message']),
              trailing:
                  Text(data[index]['date'], style: TextStyle(fontSize: 10)),
            ),
          );
        });
}

  // Widget commentChild(data) {
  //   return Expanded(
  //     child: ListView(
  //       shrinkWrap: true,
  //       children: [
  //         for (var i = 0; i < data.length; i++)
  //           Padding(
  //             padding: const EdgeInsets.fromLTRB(12.0, 8.0, 2.0, 0.0),
  //             child: ListTile(
  //               leading: GestureDetector(
  //                 onTap: () async {
  //                   // Display the image in large form.
  //                   print("Comment Clicked ${i}");
  //                 },
  //                 child: Container(
  //                   height: 50.0,
  //                   width: 50.0,
  //                   decoration: const BoxDecoration(
  //                       color: Colors.blue,
  //                       borderRadius: BorderRadius.all(Radius.circular(50))),
  //                   child: CircleAvatar(
  //                       radius: 50,
  //                       backgroundImage: CommentBox.commentImageParser(
  //                           imageURLorPath: data[i]['pic'])),
  //                 ),
  //               ),
  //               title: Text(
  //                 data[i]['name'],
  //                 style: TextStyle(fontWeight: FontWeight.bold),
  //               ),
  //               subtitle: Text(data[i]['message']),
  //               trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
  //             ),
  //           )
  //       ],
  //     ),
  //   );
  // }
  
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<Themeprovider>(context);

    return Container(
      margin: EdgeInsets.all(size.width * 0.010),
      // color: Colors.green,
      color: provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
      height: size.height * 0.49,
      width: size.width * 0.98,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // width: size.width*0.90,
              height: size.height * 0.080,
              // color: Colors.green,
              color: provider.currentTheme
                  ? light_Scaffold_color
                  : dark_Scaffold_color,
              margin: EdgeInsets.only(
                  left: size.width * 0.030, right: size.width * 0.010),
              child: Row(children: [
                Stack(children: [
                  Container(
                    width: size.width * 0.140,
                    height: size.height * 0.060,
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.0080,
                        horizontal: size.width * 0.015),
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
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Container(
                        color: Colors.red,
                        width: size.width * 0.025,
                        height: size.height * 0.012,
                      ),
                    ),
                  ),
                ]),
                SizedBox(
                  width: size.width * 0.020,
                ),
                Stack(
                  children: [
                    Container(
                      width: size.width * 0.77,
                      height: size.height * 0.070,
                      // color: Colors.amber,
                      color: provider.currentTheme
                          ? light_Scaffold_color
                          : dark_Scaffold_color,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              height: size.height * 0.070,
                              width: size.width * 0.35,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width * 0.020),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "John David",
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
                                      "Artist".toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 15, color: orange_color),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topRight,
                              height: size.height * 0.070,
                              width: size.width * 0.4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: size.width * 0.100,
                                    height: size.height * 0.018,
                                    // decoration: provider.currentTheme ? square_neu_Morphism : square_dark_neu_Morphism,
                                    // ignore: prefer_const_constructors
                                    child: InkWell(
                                      onTap: () {},
                                      child:
                                          Center(child: Icon(Icons.more_horiz)),
                                    ),
                                  ),
                                  // IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz_outlined)),
                                  Container(
                                    width: size.width * 0.190,
                                    height: size.height * 0.030,
                                    decoration: provider.currentTheme
                                        ? square_neu_Morphism
                                        : square_dark_neu_Morphism,
                                    // ignore: prefer_const_constructors
                                    child: InkWell(
                                      onTap: () {},
                                      child: Center(
                                        child: AutoSizeText("Following",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: orange_color)),
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
                  horizontal: size.width * 0.035,
                  vertical: size.height * 0.005),
              child:
                  AutoSizeText("Created with love, crafted with intelligence."),
            ),
            Container(
              // color: Colors.amber,
              margin: EdgeInsets.all(size.width * 0.020),
              decoration: provider.currentTheme
                  ? square_neu_Morphism
                  : square_dark_neu_Morphism,
              child: Row(
                children: [
                  Container(
                    height: size.height * 0.33,
                    width: size.width * 0.76,
                    // color: Colors.amber,
                    margin:
                        EdgeInsets.symmetric(horizontal: size.width * 0.010),
                    color: provider.currentTheme
                        ? light_Scaffold_color
                        : dark_Scaffold_color,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "asset/images/user_post.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.010,
                  ),
                  Container(
                    height: size.height * 0.33,
                    width: size.width * 0.13,
                    // color: Colors.amber,
                    padding: EdgeInsets.only(top: size.height * 0.015),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * 0.080,
                          height: size.height * 0.080,
                          // color: Colors.deepOrange,
                          child: GestureDetector(
                            onTap: (){
                              print("Star clicked");
                            },
                            child: Column(children: [
                              Image.asset(
                                "asset/images/highlighted_star_in_post.png",
                                width: size.width * 0.060,
                              ),
                              AutoSizeText("1k"),
                            ]),
                          ),
                        ),
                        Container(
                          width: size.width * 0.080,
                          height: size.height * 0.080,
                          // color: Colors.deepPurple,
                          child: GestureDetector(
                            onTap: (){

                              showModalBottomSheet<void>(
                                  backgroundColor: provider.currentTheme
                                      ? light_Scaffold_color
                                      : dark_Scaffold_color,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30.0),
                                  )),
                                  elevation: 15,
                                  constraints: BoxConstraints.loose(
                                      Size(size.width, size.height * 0.75)),
                                  isScrollControlled: true,
                                  context: context,
                                  // backgroundColor: Colors.transparent,
                                  builder: (BuildContext context) {
                                    return Container(
                                      padding: EdgeInsets.only(bottom:MediaQuery.of(context).viewInsets.bottom,),
                                      height: size.height * 0.70,
                                      child: CommentBox(
                                        // focusNode: myFocusNode,
                                        userImage: CommentBox.commentImageParser(
                                            imageURLorPath:
                                                "asset/images/user_logo.png"),
                                        labelText: 'Write a comment...',
                                        errorText: 'Comment cannot be blank',
                                        withBorder: false,
                                        sendButtonMethod: () {
                                          if (formKey.currentState!.validate()) {
                                            print(commentController.text);
                                            setState(() {
                                              var value = {
                                                'name': 'Vedant',
                                                'pic':
                                                    'asset/images/user_logo.png',
                                                'message':
                                                    commentController.text,
                                                'date':
                                                    '${currentDate}  /  ${currentTime}',
                                              };
                                              filedata.insert(0, value);
                                            });
                                            commentController.clear();
                                            FocusScope.of(context).unfocus();
                                          } else {
                                            print("Not validated");
                                          }
                                        },
                                        formKey: formKey,
                                        commentController: commentController,
                                        backgroundColor: provider.currentTheme
                                            ? light_Scaffold_color
                                            : dark_Scaffold_color,
                                        textColor: provider.currentTheme
                                            ? dim_black
                                            : dim_white,
                                        sendWidget: Icon(Icons.send_sharp,
                                            size: 30, color: orange_color),
                                        child: Container(
                                          height: MediaQuery.of(context)
                                              .size
                                              .height,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          //color: Colors.red,
                                          child: commentChild(filedata),
                                        ),
                                      ),
                                    );
                                  });




                              // showModalBottomSheet<void>(
                              //   constraints: BoxConstraints.loose(Size(
                              //      size.width,
                              //       size.height * 0.75)),
                              //   isScrollControlled: true,
                              //   context: context,
                              //   // backgroundColor: Colors.transparent,
                              //   builder: (BuildContext context) {
                              //     return Container(
                              //       height: size.height*0.70,
                              //       // color: Colors.amber,
                              //       color: provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
                              //       child: CommentBox(
                              //         // focusNode: myFocusNode,
                              //         userImage: CommentBox.commentImageParser(
                              //             imageURLorPath: "asset/images/user_logo.png"),
                              //         labelText: 'Write a comment...',
                              //         errorText: 'Comment cannot be blank',
                              //         withBorder: false,
                              //         sendButtonMethod: () {
                              //           if (formKey.currentState!.validate()) {
                              //             print(commentController.text);
                              //             setState(() {
                              //               var value = {
                              //                 'name': 'Vedant',
                              //                 'pic': 'asset/images/user_logo.png',
                              //                 'message': commentController.text,
                              //                 'date': '${currentDate}  /  ${currentTime}',
                              //               };
                              //               filedata.insert(0, value);
                              //             });
                              //             commentController.clear();
                              //             FocusScope.of(context).unfocus();
                              //           } else {
                              //             print("Not validated");
                              //           }
                              //         },
                              //         formKey: formKey,
                              //         commentController: commentController,
                              //         backgroundColor: provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
                              //         textColor: provider.currentTheme ? dim_black : dim_white,
                              //         sendWidget: Icon(Icons.send_sharp, size: 30, color: orange_color),
                              //         child: commentChild(filedata),
                              //       ),
                              //     );
                              //   },
                              // );
                              // Navigator.push(context, custompageroute(child: Commentpage()));
                            },
                            child: Column(children: [
                              Image.asset(
                                "asset/images/comment_in_post.png",
                                width: size.width * 0.060,
                              ),
                              AutoSizeText("47"),
                            ]),
                          ),
                        ),
                        Container(
                          width: size.width * 0.080,
                          height: size.height * 0.080,
                          // color: Colors.deepOrange,
                          child: GestureDetector(
                            onTap: (){
                              print("Share clicked");
                            },
                            child: Column(children: [
                              Image.asset(
                                "asset/images/share_in_post.png",
                                width: size.width * 0.060,
                              ),
                              AutoSizeText("12"),
                            ]),
                          ),
                        ),
                        Container(
                          width: size.width * 0.060,
                          height: size.height * 0.040,
                          // color: Colors.deepPurple,
                          child: GestureDetector(
                            onTap: (){
                              print("Download cliked");
                            },
                            child: Image.asset(
                              "asset/images/download_in_post.png",
                              width: size.width * 0.060,
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
              width: size.width * 0.935,
              height: size.height * 0.025,
              // color: Colors.red,
              color: provider.currentTheme
                  ? light_Scaffold_color
                  : dark_Scaffold_color,
              child: RichText(
                textAlign: TextAlign.end,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "2,300",
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
        ),
      ),
    );
  }
}


