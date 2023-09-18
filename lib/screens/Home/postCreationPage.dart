import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:mybindel_test/pagerouter/customPageRouter.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:mybindel_test/screens/Home/POST_&_STORY/Post_Pages/Member_Of_Your_Pages_WorldOfFriends/Member_Of_Your_Pages_WorldOfFriends.dart';
import 'package:mybindel_test/screens/Home/POST_&_STORY/Story_Enhancement/AddEffectPage_main.dart';
import 'package:mybindel_test/screens/Home/Post_&_Story/Post_Groups/Group_of_Friends_main.dart';
import 'package:mybindel_test/screens/Home/Post_&_Story/Post_Pages/Word_Of_Friends/World_Of_FriendsPage.dart';
import 'package:mybindel_test/screens/Home/Post_&_Story/TagFriends/FriendScreenPage.dart';
import 'package:mybindel_test/screens/Home/Post_&_Story/Location/AddLocation_main.dart';
import 'package:mybindel_test/screens/Home/Post_&_Story/Post_Groups/Member_of_group/Member_Of_GroupPage.dart';
import 'package:mybindel_test/widgets/fieldbutton_widget.dart';
import 'package:mybindel_test/widgets/postOptions/withoutBadge_postOptions_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../widgets/postOptions/postOptions_widget.dart';
class PostCreationPage extends StatefulWidget {
  const PostCreationPage({Key? key}) : super(key: key);

  @override
  State<PostCreationPage> createState() => _postCreationPageState();
}

class _postCreationPageState extends State<PostCreationPage> {
  final TextEditingController _multipleLine = TextEditingController();
  bool showNotification = false;
  int notification_number = 3;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor:
      provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(
                top: (4.300).h,
                left: (3.800).w,
                right: (3.800).w,
                bottom: (1.800).h),
            width: (100).w,
            height: (6.900).h,
            // color: Colors.red,
            color: provider.currentTheme
                ? light_Scaffold_color
                : dark_Scaffold_color,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: (10.00).w,
                  height: (4.500).h,
                  decoration: provider.currentTheme
                      ? square_neu_Morphism
                      : square_dark_neu_Morphism,
                  margin: EdgeInsets.symmetric(
                    vertical: (1.00).h ,
                    // horizontal: ().w * 0.040
                  ),
                  child: InkWell(
                    onTap: () {
                    },
                    child: Icon(
                      Icons.menu,
                      color: provider.currentTheme ? dim_black : dim_white,
                    ),
                  ),
                ),
                Container(
                  width: (10.00).w,
                  height: (5.00).h,
                  // color: Colors.black,
                  margin: EdgeInsets.symmetric(
                      vertical: (1.00).h,
                      horizontal: (3.00).w),
                  child: Image.asset("asset/images/logo.png"),
                ),
                Container(
                  width: (14.800).w,
                  height: (6.400).h ,
                  padding: EdgeInsets.symmetric(
                      vertical: (0.6).h ,
                      horizontal: (1.400).w),
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
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.047),
            color: provider.currentTheme
                ? light_Scaffold_color
                : dark_Scaffold_color,
            height: size.height * 0.060,
            width: size.width,
            // color: Colors.red,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                // Navigator.pushAndRemoveUntil(context, custompageroute(child: CreateUser()), (route) => false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: size.width * 0.060,
                      height: size.height * 0.030,
                      decoration: provider.currentTheme
                          ?  BoxDecoration(
                          color: const Color.fromRGBO(240, 240, 240, 1),
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 3,
                              offset: Offset(3, 3),
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                            ),
                            BoxShadow(
                              blurRadius: 3,
                              offset: Offset(-3, -3),
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                            ),
                          ])
                          :  BoxDecoration(
                          color: const Color.fromRGBO(25, 25, 25, 1.0),
                          borderRadius: BorderRadius.circular(3),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 5,
                              offset: Offset(5, 5),
                              color: Color.fromRGBO(18, 18, 18, 1.0),
                            ),
                            BoxShadow(
                              blurRadius: 3,
                              offset: Offset(-3, -5),
                              color: Color.fromRGBO(33, 33, 33, 1.0),
                            ),
                          ]),
                      child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: orange_color,
                            size: 17,
                          ))),
                  SizedBox(
                    width: size.width * 0.030,
                  ),
                  AutoSizeText(
                    "Back",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: provider.currentTheme ? dim_black : dim_white,
                        fontFamily: 'Avant',
                        fontSize: 18,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.047, vertical: size.height * 0.010),
            color: provider.currentTheme
                ? light_Scaffold_color
                : dark_Scaffold_color,
            height: size.height * 0.050,
            width: size.width,
            // color: Colors.amber,
            child: AutoSizeText(
              "Creating New Post",
              style: TextStyle(
                  color: provider.currentTheme ? dim_black : dim_white,
                  fontFamily: 'Avant',
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.045, vertical: size.height * 0.010),
            decoration: provider.currentTheme
                ? textFormField_neu_morphism
                : dark_textFormField_neu_morphism,
            child: TextFormField(
              controller: _multipleLine,
              keyboardType: TextInputType.multiline,
              minLines: 5,
              maxLines: 7,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "What's in your mind?",
                hintStyle: const TextStyle(
                    fontSize: 14,
                    letterSpacing: 1.2,
                    fontWeight: FontWeight.w500),
                contentPadding: EdgeInsets.symmetric(
                  vertical: size.height * 0.010,
                  horizontal: size.width * 0.030,
                ),
              ),
            ),
          ),
          Container(
            width: size.width,
            height: size.height * 0.20,
            color: provider.currentTheme
                ? light_Scaffold_color
                : dark_Scaffold_color,
            // color: Colors.amber,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: InkWell(
                    splashColor: orange_color,
                    // highlightColor: Colors.black,
                    onTap: () {
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03,
                          vertical: size.height * 0.01),
                      width: size.width * 90,
                      height: size.height * 0.18,
                      // color: Colors.deepOrange,
                      decoration: provider.currentTheme
                          ? neu_Morphism
                          : dark_neu_Morphism,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(bottom: size.height * 0.012),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.add,
                                    size: 35,
                                    color: orange_color,
                                  ),
                                ),
                                TextSpan(
                                  text: "\nUpload Photo/Video",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: provider.currentTheme
                                        ? dark_Scaffold_color
                                        : light_Scaffold_color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, custompageroute(child: FriendScreenPage()));
                    },
                    child: postOptions(size: size,showNotification: true,notification_number: 3,text: "Tag friends",svg: "asset/post_icons/tag.svg",),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, custompageroute(child: World_Of_friendsPage()));
                    },
                    child: postOptions(size: size,showNotification: true,notification_number: 3,text: "Share in Pages",svg: "asset/post_icons/share_page.svg",),
                  ),
                  InkWell(
                    onTap: (){},
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, custompageroute(child: Member_Of_GroupPage()));
                      },
                      child: postOptions(size: size,showNotification: true,notification_number: 3,text: "Direct message",svg: "asset/post_icons/direct_message.svg",),
                    ),
                  ),
                  //Drop down for friends to friends
                  Container(
                    width: size.width * 0.44,
                    height: size.height * 0.060,
                    margin: EdgeInsets.symmetric(
                        vertical: size.height * 0.010,
                        horizontal: size.width * 0.020),
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.008,
                        horizontal: size.width * 0.015),
                    decoration: provider.currentTheme
                        ? square_neu_Morphism
                        : square_dark_neu_Morphism,
                    child: DropdownSearch<String>(
                      popupProps: PopupProps.menu(
                        showSearchBox: true,
                        showSelectedItems: true,
                        disabledItemFn: (String s) => s.startsWith('I'),
                      ),
                      items: const ["Person 1", "Person 2", "Person 3", "Person 4"],
                      // dropdownButtonProps: DropdownButtonProps(
                      //   style: ButtonStyle()
                      // ),
                      dropdownDecoratorProps: DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                            border: InputBorder.none,
                            // labelText: "Person",
                            hintText: "Friends to friends",
                            hintStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: provider.currentTheme
                                    ? dim_black
                                    : dim_white)),
                      ),
                      onChanged: print,
                      // selectedItem: "Brazil",
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context, custompageroute(child: AddLocationPage()));
                    },
                    child: postOptionsWithoutBadge(size: size,text: "Add Location", svg: 'asset/post_icons/add_location.svg',),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, custompageroute(child: const Group_Of_FriendsPage()));
                    },
                    child: postOptionsWithoutBadge(size: size,text: "Share in Groups", svg: 'asset/post_icons/share_groups.svg',),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, custompageroute(child: Member_Of_Your_Pages_WorldOfFriends()));
                    },
                    child: postOptionsWithoutBadge(size: size,text: "Add in queue", svg: 'asset/post_icons/add_queue.svg',),
                  ),
                  InkWell(
                    onTap: (){},
                    child: postOptionsWithoutBadge(size: size,text: "Save in drive", svg: 'asset/post_icons/save_drive.svg',),
                  ),

                ],
              ),
            ],
          ),
          SizedBox(
              height: size.height * 0.10,
              width: size.width,
              // color: Colors.blue,
              ////margin: EdgeInsets.fromLTRB(0,0,0,size.height*0.050),
              child: Center(
                child: fieldbutton(
                    title: "Create",
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.010,
                        horizontal: size.width * 0.010),
                    height: size.height * 0.065,
                    width: size.width * 0.90,
                    onpressed: () {
                      Navigator.push(context, custompageroute(child: const AddEffectPage()));
                    }),
              )),
        ]),
      ),
    );
  }
}
