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
  @override
  Widget build(BuildContext context) {
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
                    filter_name: "White",
                  ),
                  FliterEffectWidget(
                    filter_name: "Bueauty",
                  ),
                  FliterEffectWidget(
                    filter_name: "Brown Tint",
                  ),
                  FliterEffectWidget(
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
                    filter_name: "White",
                  ),
                  FliterEffectWidget(
                    filter_name: "Bueauty",
                  ),
                  FliterEffectWidget(
                    filter_name: "Brown Tint",
                  ),
                  FliterEffectWidget(
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
                    filter_name: "White",
                  ),
                  FliterEffectWidget(
                    filter_name: "Bueauty",
                  ),
                  FliterEffectWidget(
                    filter_name: "Brown Tint",
                  ),
                  FliterEffectWidget(
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
  FliterEffectWidget({
    Key? key,
    required this.filter_name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.5.w, vertical: 0.1.h),
      width: (20.25).w,
      height: (15.0).h,
      child: Column(
        children: [
          Container(
            width: (18.25).w,
            height: (9.0).h,
            decoration: provider.currentTheme
                ? square_neu_Morphism
                : square_dark_neu_Morphism,
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
    );
  }
}
