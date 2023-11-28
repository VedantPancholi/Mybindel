import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../providers/selectSlideBar.dart';
import '../../../../providers/selectTheme.dart';

class Adjust extends StatefulWidget {
  const Adjust({super.key});

  @override
  State<Adjust> createState() => _AdjustState();
}

class _AdjustState extends State<Adjust> {
  List<Map<String, dynamic>> slideBarProperty = [
    {'title': 'Light', 'min': -50, 'max': 50},
    {'title': 'Contrast', 'min': -20, 'max': 50},
    {'title': 'Tint', 'min': -10, 'max': 50},
    {'title': 'Hue', 'min': -5, 'max': 50},
  ];

  int selectedSlidebar = 0;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    return Container(
      //color: Colors.purple,
      child: ChangeNotifierProvider(
        create: (context) => Slidebarprovider(),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: slideBarProperty.length,
          itemBuilder: (context, index) {
            return Consumer(
              builder: (context, Slidebarprovider adujustSelector, child) {
                return Container(
                  margin: EdgeInsets.only(bottom: (0.5).h),
                  height: (8.8).h,
                  width: (92.72).w,
                  //   color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.only(left: (1).w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all((0.5).h),
                              height: (5.31).h,
                              width: (11.84).w,
                              decoration: provider.currentTheme
                                  ? adujustSelector.getsliderbarIndex == index
                                  ? BoxDecoration(
                                  color: const Color.fromRGBO(
                                      255, 221, 219, 0.8),
                                  borderRadius:
                                  BorderRadius.circular(6),
                                  border: Border.all(
                                    color: const Color.fromRGBO(
                                        255, 83, 73, 1.0),
                                    width: 1,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(3, 3),
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.2),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-3, -3),
                                      color: Color.fromRGBO(
                                          255, 255, 255, 1.0),
                                    ),
                                  ])
                                  : BoxDecoration(
                                  color: const Color.fromRGBO(
                                      240, 240, 240, 1),
                                  borderRadius:
                                  BorderRadius.circular(3),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(3, 3),
                                      color: Color.fromRGBO(
                                          0, 0, 0, 0.2),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-3, -3),
                                      color: Color.fromRGBO(
                                          255, 255, 255, 1.0),
                                    ),
                                  ])
                                  : BoxDecoration(
                                  color:
                                  const Color.fromRGBO(25, 25, 25, 1.0),
                                  borderRadius: BorderRadius.circular(3),
                                  boxShadow: const [
                                    BoxShadow(
                                      blurRadius: 5,
                                      offset: Offset(5, 5),
                                      color:
                                      Color.fromRGBO(18, 18, 18, 1.0),
                                    ),
                                    BoxShadow(
                                      blurRadius: 3,
                                      offset: Offset(-3, -5),
                                      color:
                                      Color.fromRGBO(33, 33, 33, 1.0),
                                    ),
                                  ]),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.asset(
                                  "asset/images/user_logo.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Text(slideBarProperty[index]['title'],
                                style: TextStyle(
                                    color: adujustSelector.getsliderbarIndex ==
                                        index
                                        ? const Color.fromRGBO(253, 83, 73, 1.0)
                                        : const Color.fromRGBO(93, 93, 93, 1.0),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        Container(
                            width: (79).w,
                            child: Slidebar(
                              barnumber: index,
                              min: slideBarProperty[index]['min']!.toDouble(),
                              max: slideBarProperty[index]['max']!.toDouble(),
                            ))
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class Slidebar extends StatefulWidget {
  double min;
  double max;
  int barnumber;

  Slidebar({required this.min, required this.max, required this.barnumber});

  @override
  State<Slidebar> createState() => _SlidebarState();
}

class _SlidebarState extends State<Slidebar> {
  double sliderValue = 0;
  @override
  Widget build(BuildContext context) {
    final adujustSelector = Provider.of<Slidebarprovider>(context);

    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 0.8,
        activeTrackColor: const Color.fromRGBO(255, 83, 73, 1.0),
        inactiveTrackColor: const Color.fromRGBO(255, 83, 73, 0.8),
        trackShape: const RoundedRectSliderTrackShape(),
        thumbColor: const Color.fromRGBO(255, 221, 219, 1.0),
        thumbShape:
        const RoundSliderThumbShape(elevation: 1, pressedElevation: 5),
        valueIndicatorShape: const DropSliderValueIndicatorShape(),
        valueIndicatorColor: Colors.grey.shade400,
        overlayColor: const Color.fromRGBO(255, 83, 73, 0.2),
      ),
      child: Slider(
          value: sliderValue,
          label: sliderValue.round().toString(),
          min: widget.min,
          max: widget.max,
          divisions: 100,
          onChanged: (index) {
            setState(() {
              sliderValue = index;
              adujustSelector.changeslidebarIndex = widget.barnumber;
              print(sliderValue);
            });
          }),
    );
  }
}