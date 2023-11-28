import 'package:auto_size_text/auto_size_text.dart';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:mybindel_test/models/Friend.dart';
import 'package:mybindel_test/providers/World_Of_FriendsProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';


class World_Of_FriendsList extends ISuspensionBean{
  final String title;
  final String tag;
  World_Of_FriendsList({
    required this.title,
    required this.tag,
  });

  @override
  String getSuspensionTag() => tag;
}

class World_Of_Friends_ScrollView extends StatefulWidget {

  final List<Friend> items;

  World_Of_Friends_ScrollView({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<World_Of_Friends_ScrollView> createState() => _Word_Of_Friends_ScrollViewState();
}

class _Word_Of_Friends_ScrollViewState extends State<World_Of_Friends_ScrollView> {

  List<World_Of_FriendsList> items_list = [];
  bool isSelect = false;

//  late final list;
  @override
  void initState() {

    // final list = Word_Of_Friendssprovider.getItem;
    this.items_list = widget.items.map((item) => World_Of_FriendsList(title: item.name, tag: item.name[0].toUpperCase())).toList();
    super.initState();
  }
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final word_Of_FriendsProvider = Provider.of<World_Of_FriendsProvider>(context);
    // final tag = item.getSuspensionTag();
    // final title = item.title;
    print(currentIndex);

    return AzListView(
      // susItemHeight: 20,
      data: items_list,
      indexBarItemHeight: 2.h,
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
        // return _buildListItem(items_list[index], index, currentIndex);
        return Container(
            height: (7.5).h,
            width: (80).w,
            margin: EdgeInsets.only(right: 12.w, bottom: 1.2.h, top: 0.5.h, left: 2.4.w),
            alignment: Alignment.centerLeft,
            decoration: provider.currentTheme ? currentIndex == index ? selected_square_neu_Morphism : square_neu_Morphism : square_dark_neu_Morphism,
            child: InkWell(
              onTap: (){
                print("Tapped : ${index} ");
                currentIndex = index;
                setState(() {
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: (0.8).h, horizontal: (2.2).w),
                        child: _buildHeader(items_list[index].getSuspensionTag()),
                      ),
                      AutoSizeText(
                        items_list[index].title,
                        style: TextStyle(
                            fontSize: 20,
                            letterSpacing: 1,
                            fontWeight: FontWeight.w500,
                            color: provider.currentTheme
                                ? dim_black
                                : dim_white),
                      ),
                    ],
                  ),
                ],
              ),
            )
        );
      },
    );
  }
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