import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:mybindel_test/palette/palette.dart';

import '../../../../providers/selectTheme.dart';

class YourSoundListView extends StatefulWidget {

  String img_url;
  YourSoundListView({Key? key, required this.img_url}) : super(key: key);

  @override
  State<YourSoundListView> createState() => _YourSoundListViewState();
}

class _YourSoundListViewState extends State<YourSoundListView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Container(
              width: 95.w,
              height: (7.5).h,
              // color: Colors.amber,
              decoration: provider.currentTheme
                  ? music_listTile_neu_Morphism
                  : music_listTile_dark_neu_Morphism,
              margin:
              EdgeInsets.symmetric(vertical: (0.8).h, horizontal: (2.2).w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: (0.8).h, horizontal: (2.2).w),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  widget.img_url,
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                              top: 15,
                              left: 17,
                              child: Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.grey.shade100,
                                size: 35,
                              )),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          AutoSizeText(
                            "Downers At Dusk",
                            style: TextStyle(fontSize: 18),
                          ),
                          AutoSizeText("Talha Anjum",style: TextStyle(color: orange_color),),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 2.w),
                        decoration: provider.currentTheme
                            ? music_listTile_neu_Morphism
                            : music_listTile_dark_neu_Morphism,
                        width: 7.w,
                        height: 3.2.h,
                        child: Center(child: SvgPicture.asset("asset/music_icons/like_svg.svg",)),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 1.w),
                        alignment: Alignment.centerRight,
                        width: 26.w,
                        height: 3.0.h,
                        // color: Colors.black,
                        child: AutoSizeText(
                          "Duration Time 10s",
                          style: TextStyle(
                            fontSize: 8,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ));
        });
  }
}
