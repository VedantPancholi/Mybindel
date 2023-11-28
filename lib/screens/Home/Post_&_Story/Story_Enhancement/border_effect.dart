import 'package:flutter/material.dart';
import 'package:mybindel_test/widgets/borderContainer_widget.dart';
import 'package:provider/provider.dart';

import '../../../../providers/selectTheme.dart';

class BorderEffectContainer extends StatefulWidget {
  const BorderEffectContainer({super.key});

  @override
  State<BorderEffectContainer> createState() => _BorderEffectContainerState();
}

class _BorderEffectContainerState extends State<BorderEffectContainer> {
  int selectedBorder = 0;

  ontapped(index) {
    selectedBorder = index;
    print(selectedBorder);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    return Container(
      // color: Colors.amber,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BorderContainer(
                    index: 0,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.grey.shade100,
                        border: selectedBorder == 0
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            color: Color.fromRGBO(184, 182, 182, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(-5, -7),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ])
                        : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.grey.shade100,
                        border: selectedBorder == 4
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
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
                        ]),
                    color_name: "White",
                  ),
                  BorderContainer(
                    index: 1,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.black,
                        border: selectedBorder == 1
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            color: Color.fromRGBO(184, 182, 182, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(-5, -7),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ])
                        : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.black,
                        border: selectedBorder == 4
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
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
                        ]),
                    color_name: "Black",
                  ),
                  BorderContainer(
                    index: 2,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.deepPurple,
                        border: selectedBorder == 2
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            color: Color.fromRGBO(184, 182, 182, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(-5, -7),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ])
                        : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.deepPurple,
                        border: selectedBorder == 4
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
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
                        ]),
                    color_name: "Purple",
                  ),
                  BorderContainer(
                    index: 3,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.red,
                        border: selectedBorder == 3
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            color: Color.fromRGBO(184, 182, 182, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(-5, -7),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ])
                        : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.red,
                        border: selectedBorder == 4
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
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
                        ]),
                    color_name: "Red",
                  ),
                  // BorderContainer(color: Colors.red,),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BorderContainer(
                    index: 4,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.blue,
                        border: selectedBorder == 4
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            color: Color.fromRGBO(184, 182, 182, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(-5, -7),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ])
                        : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.blue,
                        border: selectedBorder == 4
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
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
                        ]),
                    color_name: "Sky Blue",
                  ),
                  BorderContainer(
                    index: 5,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.lightGreen,
                        border: selectedBorder == 5
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            color: Color.fromRGBO(184, 182, 182, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(-5, -7),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ])
                        : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.lightGreen,
                        border: selectedBorder == 4
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
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
                        ]),
                    color_name: "Green",
                  ),
                  BorderContainer(
                    index: 6,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.yellow,
                        border: selectedBorder == 6
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            color: Color.fromRGBO(184, 182, 182, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(-5, -7),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ])
                        : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.yellow,
                        border: selectedBorder == 4
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
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
                        ]),
                    color_name: "Yellow",
                  ),
                  BorderContainer(
                    index: 7,
                    ontap: ontapped,
                    decoration: provider.currentTheme
                        ? BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.grey.shade300,
                        border: selectedBorder == 7
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            color: Color.fromRGBO(184, 182, 182, 1.0),
                          ),
                          BoxShadow(
                            blurRadius: 5,
                            offset: Offset(-5, -7),
                            color: Color.fromRGBO(255, 255, 255, 1.0),
                          ),
                        ])
                        : BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        // theme == Brightness.light?light_Scaffold_color:dark_Scaffold_color
                        color: Colors.grey.shade300,
                        border: selectedBorder == 4
                            ? Border.all(
                          color:
                          const Color.fromRGBO(255, 83, 73, 1.0),
                          width: 2,
                        )
                            : null,
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
                        ]),
                    color_name: "Custom",
                  ),
                  // BorderContainer(color: Colors.red,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
