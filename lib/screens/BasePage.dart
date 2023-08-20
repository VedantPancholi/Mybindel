import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:mybindel_test/screens/Home/HomePage.dart';
import 'package:mybindel_test/screens/postCreationPage.dart';
import 'package:mybindel_test/screens/storyCreationPage.dart';
import 'package:provider/provider.dart';
import '../../palette/palette.dart';
import '../providers/bottomNavigationProvider.dart';
import '../providers/selectTheme.dart';
import 'Home/videoScreenPage.dart';
import 'package:flutter_svg/svg.dart';

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
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor:
        provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
        body: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.043,
                  left: size.width * 0.038,
                  right: size.width * 0.038,
                  bottom: size.height * 0.018),
              width: size.width,
              height: size.height * 0.069,
              // color: Colors.red,
              color: provider.currentTheme
                  ? light_Scaffold_color
                  : dark_Scaffold_color,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.10,
                    height: size.height * 0.045,
                    decoration: provider.currentTheme
                        ? square_neu_Morphism
                        : square_dark_neu_Morphism,
                    margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.010,
                      // horizontal: size.width * 0.040
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
                    width: size.width * 0.10,
                    height: size.height * 0.050,
                    // color: Colors.black,
                    margin: EdgeInsets.symmetric(
                        vertical: size.height * 0.010,
                        horizontal: size.width * 0.030),
                    child: Image.asset("asset/images/logo.png"),
                  ),
                  Container(
                    width: size.width * 0.148,
                    height: size.height * 0.064,
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.006,
                        horizontal: size.width * 0.014),
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
                  children: [HomePage(), VideoScreenPage(), PostCreationPage(),StoryCreationPage()],
                  onPageChanged: (index) {
                    //print("page: ${index}");
                  },
                )),
            Consumer<Navigationprovider>(
                builder: (ctx , navigationprovider , child) => Container(
                    width: size.width,
                    height: size.height * 0.1,
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
                                    ? 'asset/icons/Home.svg'
                                    : 'asset/icons2/Home.svg',
                                ontap: ontapped,
                                notification_number: 2,
                              ),
                              bottom_Icon(
                                index: 1,
                                icon: navigationprovider.current_index != 1
                                    ? 'asset/icons/Video.svg'
                                    : 'asset/icons2/Video.svg',
                                ontap: ontapped,
                                notification_number: 2,
                              ),
                              bottom_Icon(
                                index: 2,
                                icon: navigationprovider.current_index != 2
                                    ? 'asset/icons/Friends.svg'
                                    : 'asset/icons2/Friends.svg',
                                ontap: ontapped,
                                notification_number: 2,
                              ),
                              bottom_Icon(
                                index: 3,
                                icon: navigationprovider.current_index != 3
                                    ? 'asset/icons/Messages.svg'
                                    : 'asset/icons2/Messages.svg',
                                ontap: ontapped,
                                notification_number: 42,
                              ),
                              bottom_Icon(
                                index: 4,
                                icon: navigationprovider.current_index != 4
                                    ? 'asset/icons/Calls.svg'
                                    : 'asset/icons2/Calls.svg',
                                ontap: ontapped,
                                notification_number: 0,
                              )
                            ]),
                          ),
                        ),
                        bottom_Icon(
                          index: 10,
                          icon: 'asset/icons/Plus.svg',
                          iconsize: 40,
                          showNotification: false,
                          ontap: ontapped,
                          notification_number: 0,
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
                                      ? 'asset/icons/Pages.svg'
                                      : 'asset/icons2/Pages.svg',
                                  ontap: ontapped,
                                  notification_number: 12,
                                ),
                                bottom_Icon(
                                  index: 6,
                                  icon: navigationprovider.current_index != 6
                                      ? 'asset/icons/Groups.svg'
                                      : 'asset/icons2/Groups.svg',
                                  ontap: ontapped,
                                  notification_number: 2,
                                ),
                                bottom_Icon(
                                  index: 7,
                                  icon: navigationprovider.current_index != 7
                                      ? 'asset/icons/Notifications.svg'
                                      : 'asset/icons2/Notifications.svg',
                                  ontap: ontapped,
                                  notification_number: 2,
                                ),
                                bottom_Icon(
                                  index: 8,
                                  icon: navigationprovider.current_index != 8
                                      ? 'asset/icons/Drive.svg'
                                      : 'asset/icons2/Drive.svg',
                                  ontap: ontapped,
                                  notification_number: 2,
                                ),
                                bottom_Icon(
                                  index: 9,
                                  icon: navigationprovider.current_index != 9
                                      ? 'asset/icons/Settings.svg'
                                      : 'asset/icons2/Settings.svg',
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
        ));
  }
}

class bottom_Icon extends StatelessWidget {
  final int index;
  final String icon;
  void Function(int i)? ontap;
  double iconsize;
  bool showNotification;
  int notification_number;

  bottom_Icon(
      {required this.index,
        required this.icon,
        this.ontap,
        this.iconsize = 35.0,
        this.showNotification = true,
        required this.notification_number});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final size = MediaQuery.of(context).size;
    final navigationprovider = Provider.of<Navigationprovider>(context);

    return Center(
        child: GestureDetector(
            onTap: () {
              ontap!(index);
              navigationprovider.changeIndex(index);
              // print(index);
            },
            child: Container(
                margin: EdgeInsets.all(size.width * 0.035),
                width: size.width * 0.076,
                height: size.height * 0.036,
                //color: Colors.blue,
                color: light_Scaffold_color,
                child: badges.Badge(
                  badgeAnimation: badges.BadgeAnimation.slide(),
                  badgeContent: AutoSizeText(notification_number.toString()),
                  badgeStyle: badges.BadgeStyle(
                    badgeColor: orange_color,
                    padding: EdgeInsets.all(5),
                  ),
                  position: badges.BadgePosition.custom(
                    top: -10,
                    end: -2,
                  ),
                  showBadge: showNotification,
                  // child: Icon(icon, size: iconsize),
                  child: SvgPicture.asset(
                    icon,
                    fit: BoxFit.cover,
                  ),
                )),
            ),
        );
    }
}



// class bottom_Icon extends StatelessWidget {
//   final int index;
//   final IconData? icon;
//   void Function(int i)? ontap;
//   double iconsize;
//   bool showNotification;
//   int notification_number;
//
//   bottom_Icon(
//       {required this.index,
//         required this.icon,
//         this.ontap,
//         this.iconsize = 35.0,
//         this.showNotification = true,
//         required this.notification_number});
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<Themeprovider>(context);
//     final size = MediaQuery.of(context).size;
//
//     return Center(
//       child: GestureDetector(
//         onTap: () {
//           ontap!(index);
//           print(index);
//         },
//         child: Container(
//             margin: EdgeInsets.all(size.width * 0.035),
//             width: size.width * 0.076,
//             height: size.height * 0.036,
//             color: light_Scaffold_color,
//             child: badges.Badge(
//               badgeAnimation: badges.BadgeAnimation.slide(),
//               badgeContent: AutoSizeText(notification_number.toString()),
//               badgeStyle: badges.BadgeStyle(
//                 badgeColor: orange_color,
//                 padding: EdgeInsets.all(5),
//               ),
//               position: badges.BadgePosition.custom(
//                 top: -10,
//                 end: -13,
//               ),
//               showBadge: showNotification,
//               child: Icon(icon, size: iconsize),
//               // child: Image.asset(
//               //   "asset/images/Icon_play.png",
//               //   fit: BoxFit.cover,
//               // ),
//             )),
//       ),
//     );
//   }
// }
