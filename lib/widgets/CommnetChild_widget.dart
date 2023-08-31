import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import '../Dummy_Data/dummy_feed.dart';
import '../models/Comment.dart';
import '../palette/palette.dart';
import '../providers/selectCommentType.dart';
import '../providers/selectTheme.dart';

class commentChild extends StatefulWidget {
  final dynamic data;
  final dynamic context;
  final FocusNode inputnode;
  final int postIndex;
  commentChild(this.data, this.context, this.inputnode, this.postIndex);

  @override
  State<commentChild> createState() => _commentChildState();
}

class _commentChildState extends State<commentChild> {
  bool reactionsVisibility = false;
  bool repliesVisible = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final commenttypeprovider = Provider.of<Commenttypeprovider>(context);

    return ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (ctx, commentIndex) {
          return widget.data.length > 0 ?
          Container(
            margin:
                EdgeInsets.symmetric(vertical: (0.40).h, horizontal: (2.0).w),
            padding:
                EdgeInsets.symmetric(vertical: (1.00).h, horizontal: (1.50).w),
            // color: Colors.green,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: isReply ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      Container(
                        // color: Colors.amber,
                        margin: EdgeInsets.only(top: (0.3).h),
                        height: (5.0).h,
                        width: (10.0).w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(widget.data[commentIndex].picture),
                          // radius: 10,
                          // backgroundImage: CommentBox.commentImageParser(
                          //     imageURLorPath: widget.data[commentIndex].picture),
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(
                              vertical: (0.10).h, horizontal: (2.50).w),
                          // color: Colors.deepOrange,
                          // height: (10.0).h,
                          width: (55.0).w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // crossAxisAlignment: isReply ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                            children: [
                              Container(
                                  height: (2.0).h,
                                  width: (50.0).w,
                                  // color: Colors.blue,
                                  child: AutoSizeText(
                                    widget.data[commentIndex].name,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 1.2,
                                        color: provider.currentTheme
                                            ? dim_black
                                            : dim_white),
                                  )),
                              Container(
                                  // height: (2.0).h,
                                  // width: (50.0).w,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color:
                                        Colors.grey.shade400.withOpacity(0.6),
                                  ),
                                  child: ReadMoreText(
                                    widget.data[commentIndex].text,
                                    trimLines: 2,
                                    // textAlign: TextAlign.justify,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: ' View ',
                                    trimExpandedText: ' Show Less ',
                                    moreStyle: TextStyle(
                                        color: Colors.deepOrange, fontSize: 12),
                                    lessStyle: TextStyle(
                                        color: Colors.deepOrange, fontSize: 12),
                                    style: TextStyle(
                                        fontSize: 18,
                                        letterSpacing: 1.5,
                                        color: provider.currentTheme
                                            ? dim_black
                                            : dim_white,),
                                  )),
                              Row(
                                children: [
                                  //reply
                                  InkWell(
                                      onTap: () {
                                        commenttypeprovider.setPushIndex =
                                            commentIndex;
                                        commenttypeprovider.changecommentType =
                                            true;
                                        FocusScope.of(context)
                                            .requestFocus(widget.inputnode);
                                      },
                                      child: Text(
                                        "Reply",
                                        style: TextStyle(
                                            color: orange_color,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400),
                                      )),
                                  //like reaction
                                  reactionButton(widget.postIndex, commentIndex)
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                  Visibility(
                    visible: widget.data[commentIndex].replies.length > 0
                        ? true
                        : false,
                    maintainAnimation: true,
                    maintainState: true,
                    child: SizedBox(
                      width: (100).w,
                      height: repliesVisible ? null : (13.5).h,
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.data[commentIndex].replies.length,
                        itemBuilder: (context, replyIndex) {
                          return widget.data[commentIndex].replies.length >0 ?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: isReply ? MainAxisAlignment.end : MainAxisAlignment.start,
                            children: [
                              Container(
                                // color: Colors.amber,
                                margin: EdgeInsets.only(top: (0.3).h),
                                height: (5.0).h,
                                width: (10.0).w,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                      widget.data[commentIndex].picture),
                                  // radius: 10,
                                  // backgroundImage: CommentBox.commentImageParser(
                                  //     imageURLorPath: widget.data[commentIndex].picture),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: (0.10).h, horizontal: (2.50).w),
                                  // color: Colors.deepOrange,
                                  // height: (10.0).h,
                                  width: (55.0).w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // crossAxisAlignment: isReply ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: (2.0).h,
                                          width: (50.0).w,
                                          // color: Colors.blue,
                                          child: AutoSizeText(
                                            widget.data[commentIndex]
                                                .replies[replyIndex].name,
                                            softWrap: true,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1.5,
                                                color: provider.currentTheme
                                                    ? dim_black
                                                    : dim_white),
                                          )),
                                      Container(
                                          // height: (2.0).h,
                                          width: (50.0).w,
                                          // color: Colors.amber,
                                          padding:
                                      EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                    color:
                                        Colors.grey.shade400.withOpacity(0.6),
                                  ),
                                          child: ReadMoreText(
                                            widget.data[commentIndex]
                                                .replies[replyIndex].text,
                                            trimLines: 2,
                                            // textAlign: TextAlign.justify,
                                            trimMode: TrimMode.Line,
                                            trimCollapsedText: ' View ',
                                            trimExpandedText: ' Show Less ',
                                            moreStyle: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 12),
                                            lessStyle: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 12),
                                            style: TextStyle(
                                                fontSize: 16,
                                                letterSpacing: 1.5,
                                                color: provider.currentTheme
                                                    ? dim_black
                                                    : dim_white),
                                          )),
                                      Row(
                                        children: [
                                          //like reaction
                                          reactionButton(
                                              widget.postIndex, commentIndex)
                                        ],
                                      )
                                    ],
                                  )),
                            ],
                          )
                        : null;
                        
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.data[commentIndex].replies.length > 1
                        ? true
                        : false,
                    maintainState: true,
                    maintainAnimation: true,
                    child: InkWell(
                        onTap: () {
                          repliesVisible = !repliesVisible;
                          setState(() {});
                        },
                        child: repliesVisible == true ? Text("Show less replies") : Text("Show more replies")),
                  )
                ],
              ),
            ),
          )
          : Center(child: Text("No comments"),);
        });
    //   Card(
    //     margin: EdgeInsets.only(
    //         top: (1).h, bottom: (1).h, left: (2.00).w, right: (2.00).w),
    //     color: provider.currentTheme
    //         ? Colors.grey.shade100
    //         : Colors.grey.shade800,
    //     elevation: 5.0,
    //     child: Column(children: [
    //       Padding(
    //         padding: const EdgeInsets.fromLTRB(12.0, 8.0, 2.0, 0.0),
    //         child: ListTile(
    //           leading: GestureDetector(
    //             onTap: () async {
    //               print("Comment Clicked ${index}");
    //             },
    //             child: Container(
    //               height: 50.0,
    //               width: 50.0,
    //               decoration: const BoxDecoration(
    //                   color: Colors.blue,
    //                   borderRadius: BorderRadius.all(Radius.circular(50))),
    //               child: CircleAvatar(
    //                   radius: 50,
    //                   backgroundImage: CommentBox.commentImageParser(
    //                       imageURLorPath: widget.data[index].picture)),
    //             ),
    //           ),
    //           title: Text(
    //             widget.data[index].name,
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //           subtitle: Text(widget.data[index].text),
    //           trailing: InkWell(
    //             onTap: () {
    //               FocusScope.of(context).requestFocus(widget.inputnode);
    //             },
    //             child: Text("Reply"),
    //           ),
    //           // trailing:
    //           // Text(data[index].datetime, style: TextStyle(fontSize: 10)),
    //         ),
    //       ),
    //       Container(
    //         //color: Colors.amber,
    //           width: (100).w,
    //           height: (5.00).h,
    //           // decoration: BoxDecoration(
    //           //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
    //           // ),
    //           child: reactionButton(widget.reelIndex , index )
    //       ),
    //     ]),
    //   );
    // });
  }
}

class reactionButton extends StatefulWidget {
  int postIndex;
  int commentIndex;
  reactionButton(this.postIndex, this.commentIndex);

  @override
  State<reactionButton> createState() => _reactionButtonState();
}

class _reactionButtonState extends State<reactionButton> {
  bool _reactionView = false;

  List<ReactionElement> elements = [
    ReactionElement(
        Reaction.like,
        Icon(
          Icons.thumb_up_off_alt_rounded,
          color: orange_color,
          size: 20,
          weight: 10,
        )),
    ReactionElement(
        Reaction.love,
        Icon(
          Icons.favorite,
          color: Colors.red,
          size: 20,
          weight: 10,
        )),
    ReactionElement(
        Reaction.laugh,
        Icon(
          Icons.emoji_emotions_outlined,
          color: Colors.amber,
          size: 20,
          weight: 10,
        )),
    ReactionElement(
        Reaction.none,
        Icon(
          Icons.circle_sharp,
          color: Colors.grey.shade500,
          size: 10,
          weight: 10,
        )),
  ];
  final object = getobj();
  getReactionIcon(Reaction r) {
    switch (r) {
      case Reaction.like:
        return Icon(
          Icons.thumb_up_off_alt_rounded,
          color: orange_color,
          size: 20,
          weight: 10,
        );
      case Reaction.love:
        return Icon(
          Icons.favorite,
          color: Colors.red,
          size: 20,
          weight: 10,
        );
      case Reaction.laugh:
        return Icon(
          Icons.emoji_emotions_outlined,
          color: Colors.amber,
          size: 20,
          weight: 10,
        );
      case Reaction.none:
        return Icon(
          Icons.thumb_up_alt_outlined,
          size: 20,
          weight: 10,
        );
      default:
        return Icon(
          Icons.thumb_up_alt_outlined,
          size: 25,
          weight: 10,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    Reaction reaction =
        object.getReaction(widget.postIndex, widget.commentIndex);
    // print(reaction);
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (_reactionView) {
          if (details.globalPosition.dx < 100) {
            reaction = Reaction.like;
          } else if (details.globalPosition.dx < 200) {
            reaction = Reaction.love;
          } else if (details.globalPosition.dx < 300) {
            reaction = Reaction.laugh;
          } else if (details.globalPosition.dx < 300) {
            reaction = Reaction.none;
          } else {
            reaction = Reaction.none;
          }

          setState(() {});
        }
      },
      onHorizontalDragEnd: (details) {
        _reactionView = false;
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              if (_reactionView) {
                _reactionView = false;
              } else {
                if (reaction == Reaction.none) {
                  reaction = Reaction.like;
                  object.changeReaction(
                      Reaction.like, widget.postIndex, widget.commentIndex);
                } else {
                  reaction = Reaction.none;
                  object.changeReaction(
                      Reaction.none, widget.postIndex, widget.commentIndex);
                }
              }
              setState(() {});
            },
            onLongPress: () {
              _reactionView = true;
              print(_reactionView);
              setState(() {});
            },
            child: Container(
              //color: Colors.orange,
              width: (15.00).w,
              child: getReactionIcon(reaction),
            ),
          ),
          Container(
            // color: Colors.deepOrange,
            width: (25.00).w,
            child: Visibility(
              visible: _reactionView,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: Container(
                
                margin: EdgeInsets.only(bottom: (0.2).h, top: (0.8).h),
                height: 35,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30)),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: elements.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1055),
                      child: IconButton(
                        icon: elements[index].icon,
                        onPressed: () {
                          reaction = elements[index].reaction;
                          object.changeReaction(elements[index].reaction,
                              widget.postIndex, widget.commentIndex);
                          _reactionView = false;
                          setState(() {});
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReactionElement {
  final Reaction reaction;
  final Icon icon;

  ReactionElement(this.reaction, this.icon);
}
