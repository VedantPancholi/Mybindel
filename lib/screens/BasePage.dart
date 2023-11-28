import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mybindel_test/pagerouter/customPageRouter.dart';
import 'package:mybindel_test/providers/selectCommentType.dart';
import 'package:mybindel_test/screens/Home/HomePage.dart';
import 'package:mybindel_test/screens/Video/videoScreenPage.dart';
import 'package:provider/provider.dart';
import '../../palette/palette.dart';
import '../providers/bottomNavigationProvider.dart';
import '../providers/selectTheme.dart';
import 'Friends/FriendsScreen_main.dart';
import 'Friends/FriendsScreen_main.dart';
import 'Home/postCreationPage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  late PageController _pageController;
  int current_index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  ontapped(index) {
    current_index = index;
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);

    return ChangeNotifierProvider(
      create: (_) => Navigationprovider(),
      child: Scaffold(
          backgroundColor:
          provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
          body: Column(
            children: [
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
                        vertical: (1.00).h,
                        // horizontal: ().w * 0.040
                      ),
                      child: InkWell(
                        onTap: () {
                          print("menu tapped");
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
                          vertical: (1.00).h, horizontal: (3.00).w),
                      child: Image.asset("asset/images/logo.png"),
                    ),
                    Container(
                      width: (14.800).w,
                      height: (6.400).h,
                      padding: EdgeInsets.symmetric(
                          vertical: (0.6).h, horizontal: (1.400).w),
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
              Expanded(
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _pageController,
                    children: [
                      HomePage(),
                      VideoScreenPage(),
                      FriendsScreen_main() ,//FriendScreenMain(),
                      //NonFriendScreen_main()
                    ],
                    onPageChanged: (index) {
                      //print("page: ${index}");
                    },
                  )),
              Consumer<Navigationprovider>(
                builder: (ctx, navigationprovider, child) =>
                    Container(
                        width: (100).w,
                        height: (10.00).h,
                        color: light_Scaffold_color,
                        child: Row(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                reverse: true,
                                scrollDirection: Axis.horizontal,
                                child: Row(children: [
                                  bottom_Icon(
                                    index: 0,
                                    icon: navigationprovider.current_index != 0
                                        ? 'asset/BottomNavigation_icons/Home.svg'
                                        : 'asset/BottomNavigation_icons2/Home.svg',
                                    ontap: ontapped,
                                    notification_number: 2,
                                  ),
                                  bottom_Icon(
                                    index: 1,
                                    icon: navigationprovider.current_index != 1
                                        ? 'asset/BottomNavigation_icons/Video.svg'
                                        : 'asset/BottomNavigation_icons2/Video.svg',
                                    ontap: ontapped,
                                    notification_number: 2,
                                  ),
                                  bottom_Icon(
                                    index: 2,
                                    icon: navigationprovider.current_index != 2
                                        ? 'asset/BottomNavigation_icons/Friends.svg'
                                        : 'asset/BottomNavigation_icons2/Friends.svg',
                                    ontap: ontapped,
                                    notification_number: 2,
                                  ),
                                  bottom_Icon(
                                    index: 3,
                                    icon: navigationprovider.current_index != 3
                                        ? 'asset/BottomNavigation_icons/Messages.svg'
                                        : 'asset/BottomNavigation_icons2/Messages.svg',
                                    ontap: ontapped,
                                    notification_number: 42,
                                  ),
                                  bottom_Icon(
                                    index: 4,
                                    icon: navigationprovider.current_index != 4
                                        ? 'asset/BottomNavigation_icons/Calls.svg'
                                        : 'asset/BottomNavigation_icons2/Calls.svg',
                                    ontap: ontapped,
                                    notification_number: 0,
                                  )
                                ]),
                              ),
                            ),
                            bottom_Icon(
                              index: 10,
                              icon: 'asset/BottomNavigation_icons/Plus.svg',
                              iconsize: 40,
                              showNotification: false,
                              ontap: (index) {
                                Navigator.push(context,
                                    custompageroute(child: PostCreationPage()));
                              },
                              notification_number: 0,
                              width_ratio: 10.00,
                              height_ratio: 5.00,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    bottom_Icon(
                                      index: 5,
                                      icon: navigationprovider.current_index != 5
                                          ? 'asset/BottomNavigation_icons/Pages.svg'
                                          : 'asset/BottomNavigation_icons2/Pages.svg',
                                      ontap: ontapped,
                                      notification_number: 12,
                                    ),
                                    bottom_Icon(
                                      index: 6,
                                      icon: navigationprovider.current_index != 6
                                          ? 'asset/BottomNavigation_icons/Groups.svg'
                                          : 'asset/BottomNavigation_icons2/Groups.svg',
                                      ontap: ontapped,
                                      notification_number: 2,
                                    ),
                                    bottom_Icon(
                                      index: 7,
                                      icon: navigationprovider.current_index != 7
                                          ? 'asset/BottomNavigation_icons/Notifications.svg'
                                          : 'asset/BottomNavigation_icons2/Notifications.svg',
                                      ontap: ontapped,
                                      notification_number: 2,
                                    ),
                                    bottom_Icon(
                                      index: 8,
                                      icon: navigationprovider.current_index != 8
                                          ? 'asset/BottomNavigation_icons/Drive.svg'
                                          : 'asset/BottomNavigation_icons2/Drive.svg',
                                      ontap: ontapped,
                                      notification_number: 2,
                                    ),
                                    bottom_Icon(
                                      index: 9,
                                      icon: navigationprovider.current_index != 9
                                          ? 'asset/BottomNavigation_icons/Settings.svg'
                                          : 'asset/BottomNavigation_icons2/Settings.svg',
                                      ontap: ontapped,
                                      notification_number: 2,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
              ),
            ],
          )),
    );
  }
}

class bottom_Icon extends StatelessWidget {
  final int index;
  final String icon;
  void Function(int i)? ontap;
  double iconsize;
  bool showNotification;
  int notification_number;
  double height_ratio;
  double width_ratio;

  bottom_Icon(
      {required this.index,
        required this.icon,
        this.ontap,
        this.iconsize = 35.0,
        this.showNotification = true,
        this.height_ratio = 2.9,
        this.width_ratio = 7.0,
        required this.notification_number});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final navigationprovider = Provider.of<Navigationprovider>(context);

    return Center(
      child: GestureDetector(
        onTap: () {
          ontap!(index);
          navigationprovider.changeIndex(index);
          // print(index);
        },
        child: Container(
            margin: EdgeInsets.all((1.500).w),
            width: (11.600).w,
            height: (5.900).h,
            //color: Colors.blue,
            color: light_Scaffold_color,
            child: Center(
              child: badges.Badge(
                badgeAnimation: badges.BadgeAnimation.slide(),
                badgeContent: AutoSizeText(
                  notification_number.toString(),
                  style: TextStyle(
                      color: Color.fromRGBO(242, 242, 242, 1.0),
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: orange_color,
                  padding: EdgeInsets.all((1).w),
                ),
                position: badges.BadgePosition.custom(
                  top: -11,
                  end: -7,
                ),
                showBadge: showNotification,
                // child: Icon(icon, size: iconsize),
                child: SvgPicture.asset(
                  icon,
                  width: (width_ratio).w,
                  height: (height_ratio).h,
                  fit: BoxFit.cover,
                ),
              ),
            )),
      ),
    );
  }
}

