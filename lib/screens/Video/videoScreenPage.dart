import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/screens/Home/single_item.dart';
import 'package:mybindel_test/screens/Video/VideoSingle_item.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:video_player/video_player.dart';

import '../../Dummy_Data/dummy_feed.dart';
import '../../providers/selectTheme.dart';


class VideoScreenPage extends StatefulWidget {
  const VideoScreenPage({super.key});

  @override
  State<VideoScreenPage> createState() => _VideoScreenPageState();
}

class _VideoScreenPageState extends State<VideoScreenPage> {
  @override
  Widget build(BuildContext context) {
        final provider = Provider.of<Themeprovider>(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor:
        provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
        body: SingleChildScrollView(
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
                        // controller: _find,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Hey John,Whats's Shakin?",
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
                            // Navigator.push(context, custompageroute(child: StoryCreationPage()));
                          },
                          icon: Icon(
                            Icons.timelapse,
                            color: orange_color,
                            size: 25,
                          )),
                    )
                  ],
                ),
              ),
              
              ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (ctx, index) {
                    print("LISTVIEW...................");
                    return VideoSingle_item(index);
                  })
            ],
          ),
        ));
  }
}





























// class VideoScreenPage extends StatefulWidget {
//   VideoScreenPage({super.key});

//   @override
//   State<VideoScreenPage> createState() => _VideoScreenPageState();
// }

// class _VideoScreenPageState extends State<VideoScreenPage> {
//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;

//   void initState() {
//     _controller = VideoPlayerController.networkUrl(Uri.parse(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
//     _initializeVideoPlayerFuture = _controller.initialize();
//     _controller.setLooping(true);
//     _controller.setVolume(1.0);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   String _videoDuration(Duration duration){
//     String twoDigits(int n) => n.toString().padLeft(2,'0');
//     final hours = twoDigits(duration.inHours);
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));

//     return [
//       if(duration.inHours > 0) hours,
//       minutes,
//       seconds,
//     ].join(':');
//   }

// // final FlickManager flickManager = FlickManager(videoPlayerController: VideoPlayerController.asset("asset/Videos/bee.mp4"));

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: 90.w,
//         height: 30.h,
//         color: Colors.amber,
//         child: Stack(
//           children: [
//             FutureBuilder(
//                 future: _initializeVideoPlayerFuture,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     return AspectRatio(
//                       aspectRatio: _controller.value.aspectRatio,
//                       child: VideoPlayer(_controller),
//                     );
//                   } else {
//                     return Center(
//                       child: CircularProgressIndicator(color: orange_color),
//                     );
//                   }
//                 }),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Flexible(
//                       flex: 1,
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: 1.w,),
//                         child: IconButton(
//                           onPressed: () {
//                             print("play or pause clicked");
//                             setState(() {
//                               _controller.value.isPlaying
//                                   ? _controller.pause()
//                                   : _controller.play();
//                             });
//                           },
//                           icon: Icon(
//                             _controller.value.isPlaying
//                                 ? Icons.pause
//                                 : Icons.play_arrow,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: (1.2).w,
//                     ),
//                     Flexible(
//                         flex: 5,
//                         child: VideoProgressIndicator(_controller,
//                             allowScrubbing: true)),
//                     Flexible(
//                         flex: 1,
//                         child: Container(
//                           margin: EdgeInsets.symmetric(horizontal: 2.w),
//                           child: AutoSizeText(
//                             _videoDuration(_controller.value.duration),
//                             softWrap: true,
//                             wrapWords: true,
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w400
//                             ),
//                           ),
//                         )
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
