import 'package:flutter/material.dart';
import 'package:mybindel_test/Dummy_Data/Dummy_feed.dart';
import 'package:mybindel_test/pagerouter/customPageRouter.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectCommentType.dart';
import 'package:mybindel_test/screens/Home/storyCreationPage.dart';
import 'package:mybindel_test/screens/Home/storyViewPage.dart';
import 'package:provider/provider.dart';
import '../../Dummy_Data/Dummy_story.dart';
import '../../providers/selectFriends.dart';
import '../../providers/selectTheme.dart';
import '../Home/single_item.dart';
import 'package:sizer/sizer.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final postObject;
  late final storyObject;

  @override
  void initState() {
    postObject = getpostobj();
    storyObject = getstoryobj();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



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
                            Navigator.push(context,custompageroute(child: StoryCreationPage()));
                          },
                          icon: Icon(
                            Icons.add,
                            color: orange_color,
                            size: 25,
                          )),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: storyObject.getstories.length > 0 ? true : false,
                maintainState: true,
                maintainAnimation: true,
                child: Container(
                  width: (100).w,
                  height: (12.50).h,
                  padding: EdgeInsets.only(left: (1).w),
                  // color: Colors.amber,
                  color: provider.currentTheme
                      ? light_Scaffold_color
                      : dark_Scaffold_color,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: storyObject.getstories.length,
                      itemBuilder: (context, storyIndex) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, custompageroute(child: StoryViewPage(storyIndex)));
                          },
                          child: Container(
                            width: (19.0).w,
                            height: (11.0).h,
                            margin: EdgeInsets.symmetric(
                                vertical: (0.5).h ,
                                horizontal: (2.00).w),
                            // color: Colors.red,
                            padding: EdgeInsets.symmetric(
                                vertical: (1.200).h,
                                horizontal: (1.500).w),
                            decoration: provider.currentTheme
                                ? story_square_neu_Morphism
                                : story_square_dark_neu_Morphism,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.asset(
                                  "asset/images/user_logo.png",
                                  fit: BoxFit.cover,
                                )),
                          ),
                        );
                      }),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: postObject.getfeeds.length,
                  itemBuilder: (ctx, postIndex) {
                    print("LISTVIEW...................");
                    return single_item(postIndex);
                  })
            ],
          ),
        ));
  }
}

BoxDecoration story_square_neu_Morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Color.fromRGBO(240, 240, 240, 1),
    boxShadow: const [
      BoxShadow(
        blurRadius: 5,
        offset: Offset(2, 2),
        color: Color.fromRGBO(184, 182, 182, 1.0),
      ),
      BoxShadow(
        blurRadius: 5,
        offset: Offset(-5, -7),
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
    ]);

BoxDecoration story_square_dark_neu_Morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    color: Color.fromRGBO(25, 25, 25, 1.0),
    boxShadow: const [
      BoxShadow(
        blurRadius: 5,
        offset: Offset(5, 7),
        color: Color.fromRGBO(18, 18, 18, 1.0),
      ),
      BoxShadow(
        blurRadius: 3,
        offset: Offset(-3, -5),
        color: Color.fromRGBO(33, 33, 33, 1.0),
      ),
    ]);
