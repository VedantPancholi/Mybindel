import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/EffectSwiper.dart';
import 'package:mybindel_test/providers/selectTheme.dart';
import 'package:mybindel_test/screens/Home/Post_Enhances/adjust_effect.dart.dart';
import 'package:mybindel_test/widgets/fieldbutton_widget.dart';
import 'package:mybindel_test/widgets/postOptions/withoutBadge_postOptions_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../providers/AdjustSelector.dart';
import '../../../widgets/postOptions/postOptions_widget.dart';
import 'package:sizer/sizer.dart';
import 'border_effect.dart';
import 'filter_effect.dart';

class AddEffectPage extends StatefulWidget {
  const AddEffectPage({Key? key}) : super(key: key);

  @override
  State<AddEffectPage> createState() => _AddEffectPageState();
}

class _AddEffectPageState extends State<AddEffectPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor:
      provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
      body: SingleChildScrollView(
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
                    vertical: (1.00).h,
                    // horizontal: ().w * 0.040
                  ),
                  child: InkWell(
                    onTap: () {},
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
                          ? BoxDecoration(
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
                          : BoxDecoration(
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
              "Add Effects",
              style: TextStyle(
                  color: provider.currentTheme ? dim_black : dim_white,
                  fontFamily: 'Avant',
                  fontSize: 20,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Container(
            height: (36.72).h,
            width: (92.82).w,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "asset/images/user_post.png",
                  fit: BoxFit.cover,
                  )),
          ),
          SizedBox(
            height: (1.0).h,
          ),
          Container(
            width: (92.82).w,
            height: (38.00).h,
            //color: Colors.red,
            child: ChangeNotifierProvider(
                create: (context) => EffectSwiper(), child: showOptions()),
          ),
        ]),
      ),
    );
  }
}

class showOptions extends StatefulWidget {
  const showOptions({super.key});

  @override
  State<showOptions> createState() => _showOptionsState();
}

class _showOptionsState extends State<showOptions> {
  late PageController _pageController;

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

  String description(index) {
    switch (index) {
      case 0:
        return 'Long Press To Apply Effect';

      case 1:
        return 'Click to apply Filter';

      case 2:
        return 'Adjust Levels';

      default:
        return 'Enhancement';
    }
  }

  @override
  Widget build(BuildContext context) {
    final effectswiper = Provider.of<EffectSwiper>(context);

    ontapped(index) {
      effectswiper.setIndex = index;
      _pageController.jumpToPage(index);
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              width: (50).w,
              height: (4).h,
              //color: Colors.cyan,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      ontapped(0);
                    },
                    child: Consumer<EffectSwiper>(
                      builder: (context, EffectSwiper effectswiper, child) {
                        return Text(
                          'Effects',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: effectswiper.getIndex == 0
                                  ? const Color.fromRGBO(255, 83, 73, 1.0)
                                  : const Color.fromRGBO(93, 93, 93, 1.0)),
                        );
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ontapped(1);
                    },
                    child: Consumer<EffectSwiper>(
                      builder: (context, EffectSwiper effectswiper, child) {
                        return Text(
                          'Filters',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: effectswiper.getIndex == 1
                                  ? const Color.fromRGBO(255, 83, 73, 1.0)
                                  : const Color.fromRGBO(93, 93, 93, 1.0)),
                        );
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ontapped(2);
                    },
                    child: Consumer<EffectSwiper>(
                      builder: (context, EffectSwiper effectswiper, child) {
                        return Text(
                          'Adjust',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: effectswiper.getIndex == 2
                                  ? const Color.fromRGBO(255, 83, 73, 1.0)
                                  : const Color.fromRGBO(93, 93, 93, 1.0)),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              width: (27).w,
              height: (4).h,
              //color: Colors.purple,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //color: Colors.red,
                        height: (2.0).h,
                        width: (4.00).w,
                        child: SvgPicture.asset('asset/effect_icon/None.svg'),
                      ),
                      const Text("None",
                          style: TextStyle(
                              color: Color.fromRGBO(173, 173, 173, 1.0),
                              fontSize: 9,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //color: Colors.red,
                        height: (2.0).h,
                        width: (4.00).w,
                        child: SvgPicture.asset('asset/effect_icon/undo.svg'),
                      ),
                      const Text("Undo",
                          style: TextStyle(
                              color: Color.fromRGBO(173, 173, 173, 1.0),
                              fontSize: 9,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //color: Colors.red,
                        height: (2.0).h,
                        width: (4.00).w,
                        child: SvgPicture.asset('asset/effect_icon/redo.svg'),
                      ),
                      const Text("Redo",
                          style: TextStyle(
                              color: Color.fromRGBO(173, 173, 173, 1.0),
                              fontSize: 9,
                              fontWeight: FontWeight.bold))
                    ],
                  )
                  // Column()
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
                width: (70).w,
                child: Consumer(
                  builder: (context, EffectSwiper effectswiper, child) {
                    return Text(
                      description(effectswiper.getIndex),
                      style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(173, 173, 173, 1.0),
                          letterSpacing: 1),
                    );
                  },
                ))
          ],
        ),
        SizedBox(
          height: (0.5).h,
        ),
        Expanded(
          child: Container(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: const [
                  BorderEffectContainer(),
                  FilterEffectContainer(),
                  Adjust(),
                ],
                onPageChanged: (index) {
                  //print("page: ${index}");
                },
              )),
        )
      ],
    );
  }
}
