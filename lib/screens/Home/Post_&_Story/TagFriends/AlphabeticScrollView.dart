// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mybindel_test/models/Friend.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectFriends.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
class ArtistList extends ISuspensionBean{
  final String title;
  final String tag;
  ArtistList({
    required this.title,
    required this.tag,
  });

  @override
  String getSuspensionTag() => tag;
}

class AlphabeticScrollView extends StatefulWidget {

  final List<String> items;

  AlphabeticScrollView({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<AlphabeticScrollView> createState() => _AlphabeticScrollViewState();
}

class _AlphabeticScrollViewState extends State<AlphabeticScrollView> {

List<ArtistList> items_list = [];

  @override
  void initState() {
    this.items_list = widget.items.map((item) => ArtistList(title: item, tag: item[0].toUpperCase())).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);

    return AzListView(
      susItemHeight: 20,
      data: items_list, 
      physics: const BouncingScrollPhysics(),
      indexBarMargin: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0),
      indexHintBuilder: (context, tag) => Container(
        decoration: provider.currentTheme ? square_neu_Morphism : square_dark_neu_Morphism,
        width: 15.w,
        height: 5.h,
        alignment: Alignment.center,
        // color: Colors.grey.shade100,
        child: Text(
          tag,
          style: TextStyle(
            color: orange_color,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      indexBarOptions: IndexBarOptions(
        needRebuild: true,
        indexHintOffset: Offset(-20, 10),
        indexHintAlignment: Alignment.centerRight,
        selectTextStyle: TextStyle(
          color: orange_color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        selectItemDecoration: provider.currentTheme ? square_neu_Morphism : square_dark_neu_Morphism,

        decoration: provider.currentTheme 
        ? BoxDecoration(
          border: Border(right: BorderSide(color: Colors.black))
        ) 
        : BoxDecoration(
          border: Border(right: BorderSide(color: Colors.white))
        ) ,
      ),
      itemCount: items_list.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildListItem(items_list[index]);
       },

    );
  }
  
  Widget _buildListItem(ArtistList item) {
    final friendsprovider = Provider.of<Friendsprovider>(context);
final provider = Provider.of<Themeprovider>(context);
    final tag = item.getSuspensionTag();
    final title = item.title;
    return Container(
      height: (8).h,
      width: (80).w,
      margin: EdgeInsets.only(right: 12.w, bottom: 1.2.h, top: 0.5.h, left: 1.4.w),
      alignment: Alignment.centerLeft,
      decoration: provider.currentTheme ? square_neu_Morphism : square_dark_neu_Morphism,
      child: InkWell(
        onTap: (){
          if(!friendsprovider.getItem.any((element) => element.name == title))
            {
              var value = Friend(name: title, picture: 'asset/music_icons/music_bg.png', occupation: '');
              friendsprovider.addItem(value);
            }
        },
        child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: (0.8).h, horizontal: (2.2).w),
                          child: _buildHeader(tag),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: item.title,
                                    style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 1.2,
                                        fontWeight: FontWeight.w500,
                                        color: provider.currentTheme
                                            ? dim_black
                                            : dim_white),
                                  ),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.top,
                                    child: Container(
                                      width: 4.2.w,
                                      height: 2.0.h,
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.only(bottom: 0.5.h, left: 1.2.w),
                                      child: Image.asset("asset/images/check.png")),
                                  ),
                                ],
                              ),
                            ),
                            AutoSizeText("Artist".toUpperCase(), style: TextStyle(color: orange_color, fontWeight: FontWeight.w500, fontSize: 13),),
                          ],
                        ),
                      ],
                    ),
                   
                  ],
                ),
      )
      // ListTile(
      //   leading: _buildHeader(tag),
      //   title: RichText(
      //             text: TextSpan(
      //               children: [
      //                 TextSpan(
      //                   text: item.title,
      //                   style: TextStyle(
      //                       fontSize: 20,
      //                       letterSpacing: 1.2,
      //                       fontWeight: FontWeight.w500,
      //                       color: provider.currentTheme
      //                           ? dim_black
      //                           : dim_white),
      //                 ),
      //                 WidgetSpan(
      //                   alignment: PlaceholderAlignment.top,
      //                   child: Container(
      //                     width: 4.2.w,
      //                     height: 2.0.h,
      //                     alignment: Alignment.topCenter,
      //                     margin: EdgeInsets.only(bottom: 0.5.h, left: 1.2.w),
      //                     child: Image.asset("asset/images/check.png")),
      //                 ),
      //               ],
      //             ),
      //           ),
      //   // Text(item.title ,textAlign: TextAlign.left, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
      //   onTap: (){
      //     if(!friendsprovider.getItem.any((element) => element.name == title))
      //       {
      //         var value = Friend(name: title, picture: 'asset/music_icons/music_bg.png');
      //         friendsprovider.addItem(value);
      //       }
      //   },
      //   subtitle: Text("Artist".toUpperCase(), style: TextStyle(color: orange_color, fontWeight: FontWeight.w500, fontSize: 13),),
      // ),
    );}
    
      _buildHeader(tag) {
        return Container(
          width: (12.0).w,
          height: (6.0).h,
          // decoration: square_neu_Morphism,
          child: Stack(
            children: [
              ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        "asset/music_icons/music_bg.png",
                        fit: BoxFit.cover,
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
                ]
          ),
        );
      }
}


