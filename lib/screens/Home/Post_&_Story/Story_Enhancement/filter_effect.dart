// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/providers/selectTheme.dart';

class FilterEffectContainer extends StatefulWidget {
  const FilterEffectContainer({super.key});

  @override
  State<FilterEffectContainer> createState() => _FilterEffectContainerState();
}

class _FilterEffectContainerState extends State<FilterEffectContainer> {
  int selectedFilter = 0;

  ontapped(index) {
    selectedFilter = index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FliterEffectWidget(
                    index: 0,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? (selectedFilter == 0
                        ? selected_square_neu_Morphism
                        : square_neu_Morphism)
                        : (selectedFilter == 0
                        ? selected_square_dark_neu_Morphism
                        : square_dark_neu_Morphism),
                    filter_name: "White",
                  ),
                  FliterEffectWidget(
                    index: 1,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? (selectedFilter == 1
                        ? selected_square_neu_Morphism
                        : square_neu_Morphism)
                        : (selectedFilter == 1
                        ? selected_square_dark_neu_Morphism
                        : square_dark_neu_Morphism),
                    filter_name: "Bueauty",
                  ),
                  FliterEffectWidget(
                    index: 2,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? (selectedFilter == 2
                        ? selected_square_neu_Morphism
                        : square_neu_Morphism)
                        : (selectedFilter == 2
                        ? selected_square_dark_neu_Morphism
                        : square_dark_neu_Morphism),
                    filter_name: "Brown Tint",
                  ),
                  FliterEffectWidget(
                    index: 3,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? (selectedFilter == 3
                        ? selected_square_neu_Morphism
                        : square_neu_Morphism)
                        : (selectedFilter == 3
                        ? selected_square_dark_neu_Morphism
                        : square_dark_neu_Morphism),
                    filter_name: "Sway",
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FliterEffectWidget(
                    index: 4,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? (selectedFilter == 4
                        ? selected_square_neu_Morphism
                        : square_neu_Morphism)
                        : (selectedFilter == 4
                        ? selected_square_dark_neu_Morphism
                        : square_dark_neu_Morphism),
                    filter_name: "White",
                  ),
                  FliterEffectWidget(
                    index: 5,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? (selectedFilter == 5
                        ? selected_square_neu_Morphism
                        : square_neu_Morphism)
                        : (selectedFilter == 5
                        ? selected_square_dark_neu_Morphism
                        : square_dark_neu_Morphism),
                    filter_name: "Bueauty",
                  ),
                  FliterEffectWidget(
                    index: 6,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? (selectedFilter == 6
                        ? selected_square_neu_Morphism
                        : square_neu_Morphism)
                        : (selectedFilter == 6
                        ? selected_square_dark_neu_Morphism
                        : square_dark_neu_Morphism),
                    filter_name: "Brown Tint",
                  ),
                  FliterEffectWidget(
                    index: 7,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? (selectedFilter == 7
                        ? selected_square_neu_Morphism
                        : square_neu_Morphism)
                        : (selectedFilter == 7
                        ? selected_square_dark_neu_Morphism
                        : square_dark_neu_Morphism),
                    filter_name: "Sway",
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  FliterEffectWidget(
                    index: 8,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? (selectedFilter == 8
                        ? selected_square_neu_Morphism
                        : square_neu_Morphism)
                        : (selectedFilter == 8
                        ? selected_square_dark_neu_Morphism
                        : square_dark_neu_Morphism),
                    filter_name: "White",
                  ),
                  FliterEffectWidget(
                    index: 9,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? (selectedFilter == 9
                        ? selected_square_neu_Morphism
                        : square_neu_Morphism)
                        : (selectedFilter == 9
                        ? selected_square_dark_neu_Morphism
                        : square_dark_neu_Morphism),
                    filter_name: "Bueauty",
                  ),
                  FliterEffectWidget(
                    index: 10,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? (selectedFilter == 10
                        ? selected_square_neu_Morphism
                        : square_neu_Morphism)
                        : (selectedFilter == 10
                        ? selected_square_dark_neu_Morphism
                        : square_dark_neu_Morphism),
                    filter_name: "Brown Tint",
                  ),
                  FliterEffectWidget(
                    index: 11,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? (selectedFilter == 11
                        ? selected_square_neu_Morphism
                        : square_neu_Morphism)
                        : (selectedFilter == 11
                        ? selected_square_dark_neu_Morphism
                        : square_dark_neu_Morphism),
                    filter_name: "Sway",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FliterEffectWidget extends StatelessWidget {
  String filter_name;
  int index;
  void Function(int i)? ontap;
  Decoration decoration;

  FliterEffectWidget({
    Key? key,
    required this.filter_name,
    required this.index,
    required this.decoration,
    this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    return InkWell(
      onTap: () {
        ontap!(index);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.1.h),
        width: (20.25).w,
        height: (15.0).h,
        child: Column(
          children: [
            Container(
              width: (18.25).w,
              height: (9.0).h,
              decoration: decoration,
              padding:
              EdgeInsets.symmetric(vertical: (0.8).h, horizontal: (1.5).w),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    "asset/images/user_post.png",
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: (1).h,
            ),
            Container(
                width: (18.25).w,
                height: (1.25).h,
                alignment: Alignment.center,
                child: AutoSizeText(
                  filter_name,
                  softWrap: true,
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1),
                )),
          ],
        ),
      ),
    );
  }
}
