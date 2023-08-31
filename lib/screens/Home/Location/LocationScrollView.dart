// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:mybindel_test/models/Location.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';

import '../../../Dummy_Data/dummy_location.dart';

class LocationList extends ISuspensionBean{
  final String title;
  final String tag;
  LocationList({
    required this.title,
    required this.tag,
  });

  @override
  String getSuspensionTag() => tag;
}

class LocationScrollView extends StatefulWidget {

  final List<Location> items;

  LocationScrollView({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<LocationScrollView> createState() => _LocationScrollViewState();
}

class _LocationScrollViewState extends State<LocationScrollView> {

List<LocationList> items_list = [];
bool isSelect = false;

//  late final list; 
  @override
  void initState() {
    
    
    // final list = locationsprovider.getItem;
    this.items_list = widget.items.map((item) => LocationList(title: item.name, tag: item.name[0].toUpperCase())).toList();
    super.initState();
  }
 int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
        final locationprovider = Provider.of<LocationsProvider>(context);
    // final tag = item.getSuspensionTag();
    // final title = item.title;
print(currentIndex);

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
        // return _buildListItem(items_list[index], index, currentIndex);
        return Container(
      height: (8).h,
      width: (80).w,
      margin: EdgeInsets.only(right: 12.w, bottom: 1.2.h, top: 0.5.h, left: 1.4.w),
      alignment: Alignment.centerLeft,
      decoration: provider.currentTheme ? currentIndex == index ? selected_square_neu_Morphism : square_neu_Morphism : square_dark_neu_Morphism,
      child: InkWell(
        onTap: (){
          print("onTap");
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
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
                              SizedBox(height: 0.5.h,),
                            AutoSizeText("Usa".toUpperCase(), style: TextStyle(color: orange_color, fontWeight: FontWeight.w500, fontSize: 13),),
                          ],
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
