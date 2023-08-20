import 'package:flutter/material.dart';
import 'package:mybindel_test/Dummy_Data/dummy_feed.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:provider/provider.dart';
import '../../providers/selectTheme.dart';
import '../Home/single_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor:
            provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: size.height * 0.080,
                //color: Colors.amber,
                color: provider.currentTheme
                    ? light_Scaffold_color
                    : dark_Scaffold_color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.75,
                      margin: EdgeInsets.symmetric(
                          // vertical: size.height * 0.010,
                          horizontal: size.width * 0.030),
                      decoration: provider.currentTheme
                          ? textFormField_neu_morphism
                          : dark_textFormField_neu_morphism,
                      child: TextFormField(
                        // controller: _find,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Hey John,Whats's Shakin?",
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color:
                                  provider.currentTheme ? dim_black : dim_white,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.040)),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    Container(
                      width: size.width * 0.12,
                      margin: EdgeInsets.only(
                        // vertical: size.height * 0.010,
                        right: size.width * 0.040,
                        left: size.width * 0.015,
                      ),
                      decoration: provider.currentTheme
                          ? square_neu_Morphism
                          : square_dark_neu_Morphism,
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.add,
                            color: orange_color,
                            size: 25,
                          )),
                    )
                  ],
                ),
              ),
              Container(
                width: size.width,
                height: size.height * 0.100,
                // color: Colors.amber,
                // color: provider.currentTheme
                //     ? light_Scaffold_color
                //     : dark_Scaffold_color,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Container(
                        width: size.width * 0.175,
                        height: size.height * 0.065,
                        margin: EdgeInsets.symmetric(
                            vertical: size.height * 0.010,
                            horizontal: size.width * 0.020),
                        //  color: Colors.red,
                        child: Stack(fit: StackFit.expand, children: [
                          Container(
                            // color: Colors.blue,
                            margin: EdgeInsets.symmetric(
                                vertical: size.height * 0.005,
                                horizontal: size.width * 0.015),
                            padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.012,
                                horizontal: size.width * 0.015),
                            width: size.width * 0.170,
                            height: size.height * 0.060,
                            decoration: provider.currentTheme
                                ? story_square_neu_Morphism
                                : story_square_dark_neu_Morphism,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.asset(
                                  "asset/images/user_logo.png",
                                  fit: BoxFit.cover,
                                )),
                          ),
                          Positioned(
                            bottom: 1,
                            right: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Container(
                                width: size.width * 0.025,
                                height: size.height * 0.012,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ]),
                      );
                    }),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: Feeds().getfeeds.length,
                  itemBuilder: (ctx, index) {
                    return single_item(index);
                  })
            ],
          ),
        ));
  }
}

BoxDecoration story_square_neu_Morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(color: orange_color),
    color: Color.fromRGBO(240, 240, 240, 1),
    boxShadow: [
      BoxShadow(
        blurRadius: 5,
        offset: Offset(2, 2),
        color: Color.fromRGBO(184, 182, 182, 1.0),
      ),
      BoxShadow(
        blurRadius: 5,
        offset: Offset(-5, -7),
        color: Color.fromRGBO(255, 255, 255, 1.0),
      ),
    ]);

BoxDecoration story_square_dark_neu_Morphism = BoxDecoration(
    borderRadius: BorderRadius.circular(5),
    border: Border.all(color: orange_color),
    color: Color.fromRGBO(25, 25, 25, 1.0),
    boxShadow: [
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
    ]);
