import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../Dummy_Data/dummy_feed.dart';
import '../models/Comment.dart';
import '../palette/palette.dart';
import '../providers/selectTheme.dart';

class commentChild extends StatefulWidget {
  final dynamic data;
  final dynamic context;
  final FocusNode inputnode;
  final int reelIndex;
  commentChild(this.data, this.context, this.inputnode , this.reelIndex);

  @override
  State<commentChild> createState() => _commentChildState();
}

class _commentChildState extends State<commentChild> {
  bool reactionsVisibility = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);

    return ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.only(
                top: (1).h, bottom: (1).h, left: (2.00).w, right: (2.00).w),
            color: provider.currentTheme
                ? Colors.grey.shade100
                : Colors.grey.shade800,
            elevation: 5.0,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 8.0, 2.0, 0.0),
                child: ListTile(
                  leading: GestureDetector(
                    onTap: () async {
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
                              imageURLorPath: widget.data[index].picture)),
                    ),
                  ),
                  title: Text(
                    widget.data[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(widget.data[index].text),
                  trailing: InkWell(
                    onTap: () {
                      FocusScope.of(context).requestFocus(widget.inputnode);
                    },
                    child: Text("Reply"),
                  ),
                  // trailing:
                  // Text(data[index].datetime, style: TextStyle(fontSize: 10)),
                ),
              ),
              Container(
                //color: Colors.amber,
                  width: (100).w,
                  height: (5.00).h,
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                  // ),
                  child: reactionButton(widget.reelIndex , index )
              ),
            ]),
          );
        });
  }
}



class reactionButton extends StatefulWidget {
  int reelIndex;
  int commentIndex;
  reactionButton(this.reelIndex , this.commentIndex);

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
          size: 25,
          weight: 10,
        )),
    ReactionElement(
        Reaction.love,
        Icon(
          Icons.favorite,
          color: Colors.red,
          size: 25,
          weight: 10,
        )),
    ReactionElement(
        Reaction.laugh,
        Icon(
          Icons.emoji_emotions_outlined,
          color: Colors.amber,
          size: 25,
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
          size: 25,
          weight: 10,
        );
      case Reaction.love:
        return Icon(
          Icons.favorite,
          color: Colors.red,
          size: 25,
          weight: 10,
        );
      case Reaction.laugh:
        return Icon(
          Icons.emoji_emotions_outlined,
          color: Colors.amber,
          size: 25,
          weight: 10,
        );
      case Reaction.none:
        return Icon(
          Icons.thumb_up_alt_outlined,
          size: 25,
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
    Reaction reaction = object.getReaction(widget.reelIndex,widget.commentIndex);
    print(reaction);
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
          Container(
            // color: Colors.deepOrange,
            width: (55.00).w,
            child: Visibility(
              visible: _reactionView,
              maintainAnimation: true,
              maintainSize: true,
              maintainState: true,
              child: Container(
                margin: EdgeInsets.only(bottom:(1).w),
                height: 65,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(30)),
                child: ListView.builder(
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
                          object.changeReaction( elements[index].reaction , widget.reelIndex , widget.commentIndex);
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
          GestureDetector(
            onTap: () {
              if (_reactionView) {
                _reactionView = false;

              } else {
                if (reaction == Reaction.none) {
                  reaction = Reaction.like;
                  object.changeReaction(Reaction.like , widget.reelIndex ,widget.commentIndex);
                } else {
                  reaction = Reaction.none;
                  object.changeReaction(Reaction.none , widget.reelIndex , widget.commentIndex);
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
