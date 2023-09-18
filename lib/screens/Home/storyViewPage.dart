import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mybindel_test/Dummy_Data/Dummy_story.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';
import 'package:sizer/sizer.dart';
import '../../models/Story.dart';
import '../../palette/palette.dart';
import '../../providers/selectTheme.dart';

class StoryViewPage extends StatefulWidget {
  int intialIndex;
  StoryViewPage(this.intialIndex);

  @override
  State<StoryViewPage> createState() => _StoryViewPageState();
}

class _StoryViewPageState extends State<StoryViewPage>
    with SingleTickerProviderStateMixin {
  late int currentUserIndex;
  late PageController _userpageController;
  late final storyObject;

  @override
  void initState() {
    currentUserIndex = widget.intialIndex;
    _userpageController =
        PageController(initialPage: widget.intialIndex, keepPage: false);
    storyObject = getstoryobj();
    print("___________________________________ story init called");
    super.initState();
  }

  @override
  void dispose() {
    _userpageController.dispose();
    print("___________________________________ story dispose called");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final stories = storyObject.getstories;

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent.withOpacity(0.8),
        body: GestureDetector(
          onPanUpdate: (details) {
            if (MediaQuery.of(context).viewInsets.bottom == 0) {
              if (details.delta.dx < 0) {
                _userpageController.nextPage(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
              }

              if (details.delta.dx > 0) {
                _userpageController.previousPage(
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut);
              }
            }
          },
          child: PageView.builder(
              controller: _userpageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: stories.length,
              itemBuilder: (context, userIndex) {
                final selectedUser = stories[userIndex];
                return singleUserStoryPage(
                  selectedUser: selectedUser,
                );
              }),
        ));
  }
}


class singleUserStoryPage extends StatefulWidget {
  final singleUserStory selectedUser;
  singleUserStoryPage({required this.selectedUser});

  @override
  State<singleUserStoryPage> createState() => _singleUserStoryState();
}

class _singleUserStoryState extends State<singleUserStoryPage>
    with SingleTickerProviderStateMixin {
  FocusNode mynode = FocusNode();
  int initfirstTime = 0;
  int currentStoryIndex = 0;
  late PageController _pageController;
  late VideoPlayerController _videoController;
  late AnimationController _animationController;
  late TextEditingController _replyController;
  List<MaterialColor> colors = [
    Colors.red,
    Colors.pink,
    Colors.cyan,
    Colors.yellow
  ];

  @override
  void initState() {
    _replyController = TextEditingController();
    _pageController = PageController();
    _animationController = AnimationController(vsync: this);

    final firstStory = widget.selectedUser.stories.first;
    _loadStory(story: firstStory, animateToPage: false);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.stop();
        _animationController.reset();
        setState(() {
          if (currentStoryIndex + 1 < widget.selectedUser.stories.length) {
            currentStoryIndex += 1;
            _loadStory(story: widget.selectedUser.stories[currentStoryIndex]);
          } else {
            currentStoryIndex = 0;
            _loadStory(story: widget.selectedUser.stories[currentStoryIndex]);
          }
        });
      }
    });
    print("_______________________________init called");
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    if (initfirstTime > 0) {
      _videoController.dispose();
    }
    _animationController.dispose();
    _replyController.dispose();
    print("_______________________________dispose called");
    super.dispose();
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    _animationController.stop();
    _animationController.reset();
    switch (story.mediaType) {
      case MediaType.image:
        _animationController.duration = Duration(seconds: 5);
        _animationController.forward();
        break;

      case MediaType.video:
        initfirstTime++;
        _videoController =
        VideoPlayerController.networkUrl(Uri.parse(story.url))
          ..initialize().then((_) {
            setState(() {});
            if (_videoController.value.isInitialized) {
              _animationController.duration =
                  _videoController.value.duration;
              _videoController.play();
              _animationController.forward();
            }
          });
        break;
    }

    if (animateToPage == true) {
      print(currentStoryIndex);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_pageController.hasClients) {
          _pageController.animateToPage(currentStoryIndex,
              duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        print("tapped____________________");
        final screen = MediaQuery.of(context).size;

        if (MediaQuery.of(context).viewInsets.bottom == 0) {
          print("false");
        } else {
          print("true");
        }

        if (details.globalPosition.dx < screen.width / 2 &&
            details.globalPosition.dy > screen.height / 8 &&
            details.globalPosition.dy < (screen.height / 8) * 6.5) {
          if (currentStoryIndex > 0) {
            if (widget.selectedUser.stories[currentStoryIndex].mediaType ==
                MediaType.video) {
              _videoController.value.isPlaying
                  ? _videoController.pause()
                  : null;
            }
            currentStoryIndex -= 1;
            _loadStory(story: widget.selectedUser.stories[currentStoryIndex]);
            setState(() {});
          }
        }

        if (details.globalPosition.dx > screen.width / 2 &&
            details.globalPosition.dy > screen.height / 8 &&
            details.globalPosition.dy < (screen.height / 8) * 6.5) {
          if (currentStoryIndex < widget.selectedUser.stories.length - 1) {
            if (widget.selectedUser.stories[currentStoryIndex].mediaType ==
                MediaType.video) {
              _videoController.value.isPlaying
                  ? _videoController.pause()
                  : null;
            }
            currentStoryIndex += 1;
            _loadStory(story: widget.selectedUser.stories[currentStoryIndex]);
            setState(() {});
          }
        }
      },
      child: Container(
        height: (100).h,
        width: (100).w,
        child: Stack(
          children: [
            PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.selectedUser.stories.length,
                itemBuilder: (context, storyindex) {
                  final story = widget.selectedUser.stories[storyindex];
                  switch (story.mediaType) {
                    case MediaType.image:
                      return CachedNetworkImage(
                        imageUrl: story.url,
                        fit: BoxFit.contain,
                      );
                    case MediaType.video:
                      if (_videoController.value.isInitialized) {
                        return FittedBox(
                          fit: BoxFit.contain,
                          child: SizedBox(
                            width: _videoController.value.size.width,
                            height: _videoController.value.size.height,
                            child: VideoPlayer(_videoController),
                          ),
                        );
                      }
                  }
                  return SizedBox.shrink();
                }),
            Container(
                height: (100).h,
                width: (100).w,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: (4.300).h,
                          left: (3.800).w,
                          right: (3.800).w,
                          bottom: (1.800).h),
                      width: (100).w,
                      height: (8.900).h,
                      // color: Colors.red,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: (7.692).w,
                            height: (3.554).h,
                            decoration: BoxDecoration(
                                color: Colors.transparent.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(5)),
                            margin: EdgeInsets.symmetric(
                              vertical: (1.00).h,
                              // horizontal: ().w * 0.040
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: const Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Color.fromRGBO(245, 245, 245, 1.0),
                                size: 12,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                width: (15.0).w,
                                height: (6.607).h,
                                padding: EdgeInsets.symmetric(
                                    vertical: (0.6).h, horizontal: (1.400).w),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    widget.selectedUser.user.picture,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Text(
                                widget.selectedUser.user.name,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(255, 255, 255, 1.0),
                                    letterSpacing: 0.5),
                              )
                            ],
                          ),
                          Container(
                              width: (7.692).w,
                              height: (3.554).h,
                              decoration: BoxDecoration(
                                  color: Colors.transparent.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(5)),
                              margin: EdgeInsets.symmetric(
                                vertical: (1.00).h,
                                // horizontal: ().w * 0.040
                              ),
                              child: PopupMenuButton(
                                onOpened: () {
                                  _animationController.stop();
                                  if (widget
                                      .selectedUser
                                      .stories[currentStoryIndex]
                                      .mediaType ==
                                      MediaType.video) {
                                    _videoController.pause();
                                  }
                                },
                                onCanceled: () {
                                  _animationController.forward();
                                  if (widget
                                      .selectedUser
                                      .stories[currentStoryIndex]
                                      .mediaType ==
                                      MediaType.video) {
                                    _videoController.play();
                                  }
                                },
                                color: Colors.transparent.withOpacity(
                                    0.3), //Color.fromRGBO(204, 204, 204, 0.4),
                                padding: const EdgeInsets.all(0),
                                constraints: BoxConstraints.expand(
                                    width: (33.84).w, height: (23.14).h),
                                offset: const Offset(0, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 3,
                                icon: const Icon(
                                  Icons.more_horiz_rounded,
                                  color: Color.fromRGBO(245, 245, 245, 1),
                                  size: 20,
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
                                                color: const Color.fromRGBO(
                                                    242, 242, 242, 0.4),
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            child: const Icon(
                                              Icons.article_outlined,
                                              color: Color.fromRGBO(
                                                  242, 242, 242, 1),
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
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontSize: 14,
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
                                                color: const Color.fromRGBO(
                                                    242, 242, 242, 0.4),
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            child: const Icon(
                                              Icons.visibility_off_rounded,
                                              color: Color.fromRGBO(
                                                  242, 242, 242, 1),
                                              size: 26,
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              // color: Colors.yellow,
                                              child: const Center(
                                                child: Text(
                                                  'Hide',
                                                  style: TextStyle(
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontSize: 14,
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
                                                color: const Color.fromRGBO(
                                                    242, 242, 242, 0.4),
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            child: const Icon(
                                              Icons.person_off_rounded,
                                              color: Color.fromRGBO(
                                                  242, 242, 242, 1),
                                              size: 26,
                                            ),
                                          ),
                                          const Expanded(
                                            child: Center(
                                              child: Text(
                                                'Unfollow',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                    fontSize: 14,
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
                                            height: (4.55).h,
                                            width: (9.0).w,
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    242, 242, 242, 0.4),
                                                borderRadius:
                                                BorderRadius.circular(5)),
                                            child: const Icon(
                                              Icons.report,
                                              color: Color.fromRGBO(
                                                  242, 242, 242, 1),
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
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 1),
                                                      fontSize: 14,
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
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: (16.92).h,
                      width: (100).w,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.transparent.withOpacity(0.7),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  height: (3.94).h,
                                  width: (70).w,
                                  child: const SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    child: ReadMoreText(
                                        'Hi John, How are you? I just want to ask about today’s lesson which I missed because ',
                                        trimLines: 2,
                                        // textAlign: TextAlign.justify,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: ' More ',
                                        trimExpandedText: ' Less ',
                                        delimiter: '',
                                        moreStyle: TextStyle(
                                            color: Color.fromRGBO(
                                                242, 242, 242, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                        lessStyle: TextStyle(
                                            color: Color.fromRGBO(
                                                242, 242, 242, 1),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                        style: TextStyle(
                                          fontSize: 16,
                                          letterSpacing: 1.5,
                                          color:
                                          Color.fromRGBO(242, 242, 242, 1),
                                        )),
                                  ),
                                ),
                                Container(
                                  height: (2.5).h,
                                  width: (12.7).w,
                                  child: const Text(
                                    'Today 12:33PM',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      fontSize: 10,
                                      letterSpacing: 1.5,
                                      color: Color.fromRGBO(242, 242, 242, 1),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: (5.50).h,
                                  width: (79.23).w,
                                  margin: EdgeInsets.only(top: (1).h),
                                  child: Form(
                                    child: TextFormField(
                                      controller: _replyController,
                                      focusNode: mynode,
                                      textInputAction: TextInputAction.send,
                                      onTap: () {
                                        _animationController.stop();
                                        FocusScope.of(context)
                                            .requestFocus(mynode);
                                        if (widget
                                            .selectedUser
                                            .stories[currentStoryIndex]
                                            .mediaType ==
                                            MediaType.video) {
                                          _videoController.pause();
                                        }
                                      },
                                      // onTapOutside: (val) {
                                      //   _animationController.forward();
                                      //   FocusScope.of(context).requestFocus(FocusNode());
                                      //   if (widget.selectedUser.stories[currentStoryIndex].mediaType == MediaType.video) {
                                      //     _videoController.play();
                                      //   }
                                      // },
                                      onFieldSubmitted: (val) {
                                        print(_replyController.text);
                                        _animationController.forward();
                                        if (widget
                                            .selectedUser
                                            .stories[currentStoryIndex]
                                            .mediaType ==
                                            MediaType.video) {
                                          _videoController.play();
                                        }
                                      },
                                      cursorColor: Colors.grey.shade400,
                                      cursorRadius: const Radius.circular(4),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromRGBO(
                                            242, 242, 242, 0.3),
                                        hintText: ' Reply',
                                        hintStyle: const TextStyle(
                                            color: Color.fromRGBO(
                                                242, 242, 242, 1),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 2),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(6),
                                          borderSide: const BorderSide(
                                              color: Color.fromRGBO(
                                                  242, 242, 242, 0.2),
                                              width: 0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(6),
                                          borderSide: const BorderSide(
                                              color: Color.fromRGBO(
                                                  242, 242, 242, 0.2),
                                              width: 0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                          BorderRadius.circular(6),
                                          borderSide: const BorderSide(
                                              color: Color.fromRGBO(
                                                  242, 242, 242, 0.2),
                                              width: 0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: (9.7).w,
                                  height: (4.50).h,
                                  margin: EdgeInsets.only(top: (1).h),
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          242, 242, 242, 0.2),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: InkWell(
                                    onTap: () {
                                      print("Like tapped");
                                    },
                                    child: const Icon(
                                      Icons.star_rounded,
                                      color: Color.fromRGBO(245, 245, 245, 1.0),
                                      size: 22,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ),
                  ],
                )),
            Positioned(
                left: 10,
                right: 10,
                bottom: 15,
                child: Row(
                    children: widget.selectedUser.stories
                        .asMap()
                        .map((i, e) {
                      return MapEntry(
                          i,
                          Animatedbar(
                              animationController: _animationController,
                              position: i,
                              currentStoryIndex: currentStoryIndex));
                    })
                        .values
                        .toList()))
          ],
        ),
      ),
    );
  }
}

class Animatedbar extends StatelessWidget {
  final AnimationController animationController;
  final int position;
  final int currentStoryIndex;
  const Animatedbar(
      {required this.animationController,
        required this.currentStoryIndex,
        required this.position});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.5),
          child: LayoutBuilder(
            builder: (context, Constraints) {
              return Stack(
                children: [
                  _buildContainer(
                      width: double.infinity,
                      color: position < currentStoryIndex
                          ? Colors.white
                          : Colors.white.withOpacity(0.5)),
                  position == currentStoryIndex
                      ? AnimatedBuilder(
                      animation: animationController,
                      builder: (context, index) {
                        return _buildContainer(
                            width: Constraints.maxWidth *
                                animationController.value,
                            color: Colors.white);
                      })
                      : SizedBox.shrink()
                ],
              );
            },
          ),
        ));
  }
}

Container _buildContainer({required double width, required Color color}) {
  return Container(
    width: width,
    height: 5,
    decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.black26),
        borderRadius: BorderRadius.circular(4)),
  );
}