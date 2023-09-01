import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mybindel_test/Dummy_Data/dummy_group_of_friends.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:mybindel_test/screens/Group_of_friends/ScrollView_Group_of_friends.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Group_Of_FriendsPage extends StatefulWidget {
  const Group_Of_FriendsPage({super.key});

  @override
  State<Group_Of_FriendsPage> createState() => _Group_Of_FriendsPageState();
}

class _Group_Of_FriendsPageState extends State<Group_Of_FriendsPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => Group_of_friendsProvider(),
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          // backgroundColor: provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
          body: Column(
            children: [
              Container(
                width: (95.0).w,
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
                      hintText: "Search In Groups",
                      hintStyle: TextStyle(
                        fontSize: 15,
                        color: provider.currentTheme ? dim_black : dim_white,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: (4.00).w)),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: (1.2).h),
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.047,
                    vertical: size.height * 0.010),
                color: provider.currentTheme
                    ? light_Scaffold_color
                    : dark_Scaffold_color,
                height: size.height * 0.055,
                width: size.width,
                // color: Colors.amber,
                child: AutoSizeText(
                  "Group Of Friends",
                  style: TextStyle(
                      color: provider.currentTheme ? dim_black : dim_white,
                      fontFamily: 'Avant',
                      fontSize: 20,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: Consumer(builder: (context,
                    Group_of_friendsProvider group_of_friendsProvider, child) {
                  return Group_of_friends_Scroll_View(
                    items: group_of_friendsProvider.getItem,
                    // onClickedIem : (item){},
                  );
                }),
              )
            ],
          )),
    );
  }
}
