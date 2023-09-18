import 'package:flutter/material.dart';
import 'package:mybindel_test/widgets/borderContainer_widget.dart';

class BorderEffectContainer extends StatefulWidget {
  const BorderEffectContainer({super.key});

  @override
  State<BorderEffectContainer> createState() => _BorderEffectContainerState();
}

class _BorderEffectContainerState extends State<BorderEffectContainer> {
  @override
  Widget build(BuildContext context) {
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
                  BorderContainer(color: Colors.grey.shade100,color_name: "White",),
                  BorderContainer(color: Colors.black,color_name: "Black",),
                  BorderContainer(color: Colors.blueAccent,color_name: "Sky Blue",),
                  BorderContainer(color: Colors.red,color_name: "Red",),
                  // BorderContainer(color: Colors.red,),
                ],
              ),
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BorderContainer(color: Colors.blue,color_name: "Blue",),
                  BorderContainer(color: Colors.blueAccent,color_name: "Sky Blue",),
                  BorderContainer(color: Colors.red,color_name: "Red",),
                  BorderContainer(color: Colors.deepOrange,color_name: "Custum",),
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