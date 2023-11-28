import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/screens/Video/VideoSingle_item.dart';
import 'package:video_player/video_player.dart';
import '../../pagerouter/customPageRouter.dart';
import '../../providers/selectTheme.dart';
import 'WatchHistory.dart';


class VideoScreenPage extends StatefulWidget {
  const VideoScreenPage({super.key});

  @override
  State<VideoScreenPage> createState() => _VideoScreenPageState();
}

class _VideoScreenPageState extends State<VideoScreenPage> {
  bool onSearch = false;
  List<String> search = [];
  TextEditingController _findController = TextEditingController();

  @override
  void initState() {
    getSearches();
    super.initState();
  }

  @override
  void dispose() {
    setSearches();
    super.dispose();
  }

  void setSearches() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList('searches', search);
  }

  void getSearches() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    search = await sharedPreferences.getStringList('searches') ?? [];
  }

  Widget getSearch(int index) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: (0.2).h),
      child: ListTile(
        onTap: () {},
        title: Row(
          children: [
            Container(
              width: (10.0).w,
              child: Icon(Icons.history),
            ),
            Container(
              width: (67.5).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    search[index],
                    style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          search.removeAt(index);
                        });
                      },
                      icon: Icon(Icons.close)),
                ],
              ),
            ),
          ],
        ),
        // trailing: IconButton(
        //     onPressed: () {
        //       setState(() {
        //       search.removeAt(index);
        //       });
        //     },
        //     icon: Icon(Icons.close)),
        // leading: Icon(Icons.history),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor:
        provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
        body: onSearch?
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: (8.0).w,
                      height:  (4.0).h,
                      margin: EdgeInsets.only(bottom: (0.50).h),
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
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                          size: 17,
                          color: orange_color,
                        ),
                        onPressed: () {
                          onSearch = !onSearch;
                          setState(() {});
                        },
                      )),
                  SizedBox(
                    width: (3.0).w,
                  ),
                  Container(
                    width: (70.0).w,
                    height: (5.0).h,
                    decoration: provider.currentTheme
                        ? textFormField_neu_morphism
                        : dark_textFormField_neu_morphism,
                    child: TextFormField(
                      autocorrect: true,
                      autofocus: true,
                      controller: _findController,
                      onFieldSubmitted: (val) {
                        String name = _findController.text.trim();
                        if (name.isNotEmpty) {
                          print("bypass condition");
                          _findController.text = "";
                          search.add(name);
                        }
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Videos",
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
                  SizedBox(
                    width: (3.0).w,
                  ),
                  Container(
                      width: (9.0).w,
                      height: (4.0).h,
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
                          child: IconButton(
                            onPressed: () {
                              print("History button pressed");
                              // storing the names
                              String name = _findController.text.trim();
                              if (name.isNotEmpty) {
                                _findController.text = "";
                                search.add(name);
                              }
                            },
                            icon: Icon(
                              Icons.history,
                              size: 18,
                            ),
                            color: orange_color,
                          ))),
                ],
              ),
            ),
            search.isEmpty
                ? Center(child: Text("No data found"))
                : Expanded(
              child: ListView.builder(
                  itemCount: search.length,
                  itemBuilder: (context, index) => getSearch(index)),
            ),
          ],
        ) :
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: (100).w,
                height: (8.00).h,
                //color: Colors.amber,
                color: provider.currentTheme
                    ? light_Scaffold_color
                    : dark_Scaffold_color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (75.0).w,
                      margin: EdgeInsets.symmetric(
                        // vertical: ().h * 0.010,
                          horizontal: (3.00).w),
                      decoration: provider.currentTheme
                          ? textFormField_neu_morphism
                          : dark_textFormField_neu_morphism,
                      child: TextFormField(
                        // controller: _find,
                        onTap: (){
                          onSearch = !onSearch;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Videos",
                            hintStyle: TextStyle(
                              fontSize: 15,
                              color:
                              provider.currentTheme ? dim_black : dim_white,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: (4.00).w )),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                      ),
                    ),
                    Container(
                      width: (12.00).w,
                      margin: EdgeInsets.only(
                        // vertical: ().h * 0.010,
                        right: (4.00).w,
                        left: (1.50).w,
                      ),
                      decoration: provider.currentTheme
                          ? square_neu_Morphism
                          : square_dark_neu_Morphism,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(custompageroute(child: WatchHistory()));
                          },
                          icon: Icon(
                            Icons.access_time_sharp,
                            color: Colors.grey.shade800,
                            size: 25,
                          )),
                    )
                  ],
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (ctx, index) {
                    print("LISTVIEW...................");
                    return VideoSingle_item(index);
                  })
            ],
          ),
        )
    );


  }

// Widget _search(String value) {
//   return ;

// }
}
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   List<String> search = [];
//   TextEditingController _findController = TextEditingController();
//
//   @override
//   void initState() {
//     getSearches();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     setSearches();
//     super.dispose();
//   }
//
//   void setSearches() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     sharedPreferences.setStringList('searches', search);
//   }
//
//   void getSearches() async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     search = await sharedPreferences.getStringList('searches') ?? [];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<Themeprovider>(context);
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       backgroundColor:
//           provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
//       body: Column(
//         children: [
//
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 1.h),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                     width: size.width * 0.080,
//                     height: size.height * 0.040,
//                     margin: EdgeInsets.only(bottom: (0.50).h),
//                     decoration: provider.currentTheme
//                         ? BoxDecoration(
//                             color: const Color.fromRGBO(240, 240, 240, 1),
//                             borderRadius: BorderRadius.circular(3),
//                             boxShadow: const [
//                                 BoxShadow(
//                                   blurRadius: 3,
//                                   offset: Offset(3, 3),
//                                   color: Color.fromRGBO(0, 0, 0, 0.2),
//                                 ),
//                                 BoxShadow(
//                                   blurRadius: 3,
//                                   offset: Offset(-3, -3),
//                                   color: Color.fromRGBO(255, 255, 255, 1.0),
//                                 ),
//                               ])
//                         : BoxDecoration(
//                             color: const Color.fromRGBO(25, 25, 25, 1.0),
//                             borderRadius: BorderRadius.circular(3),
//                             boxShadow: const [
//                                 BoxShadow(
//                                   blurRadius: 5,
//                                   offset: Offset(5, 5),
//                                   color: Color.fromRGBO(18, 18, 18, 1.0),
//                                 ),
//                                 BoxShadow(
//                                   blurRadius: 3,
//                                   offset: Offset(-3, -5),
//                                   color: Color.fromRGBO(33, 33, 33, 1.0),
//                                 ),
//                               ]),
//                     child: IconButton(
//                       icon: Icon(
//                         Icons.arrow_back_ios_rounded,
//                         size: 17,
//                         color: orange_color,
//                       ),
//                       onPressed: () {
//                       },
//                     )),
//                 SizedBox(
//                   width: size.width * 0.030,
//                 ),
//                 Container(
//                   width: size.width * 0.700,
//                   height: size.height * 0.050,
//                   decoration: provider.currentTheme
//                       ? textFormField_neu_morphism
//                       : dark_textFormField_neu_morphism,
//                   child: TextFormField(
//                     autocorrect: true,
//                     autofocus: true,
//                     controller: _findController,
//                     onFieldSubmitted: (val) {
//                       String name = _findController.text.trim();
//                       if (name.isNotEmpty) {
//                         print("bypass condition");
//                         setState(() {
//                           _findController.text = "";
//                           search.add(name);
//                         });
//                       }
//                     },
//                     onChanged: (value) {
//                       print(value);
//                     },
//                     decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: "Search Videos",
//                         hintStyle: TextStyle(
//                           fontSize: 15,
//                           color: provider.currentTheme ? dim_black : dim_white,
//                         ),
//                         contentPadding:
//                             EdgeInsets.symmetric(horizontal: (4.00).w)),
//                     keyboardType: TextInputType.text,
//                     textInputAction: TextInputAction.done,
//                   ),
//                 ),
//                 SizedBox(
//                   width: size.width * 0.030,
//                 ),
//                 Container(
//                     width: size.width * 0.090,
//                     height: size.height * 0.040,
//                     decoration: provider.currentTheme
//                         ? BoxDecoration(
//                             color: const Color.fromRGBO(240, 240, 240, 1),
//                             borderRadius: BorderRadius.circular(3),
//                             boxShadow: const [
//                                 BoxShadow(
//                                   blurRadius: 3,
//                                   offset: Offset(3, 3),
//                                   color: Color.fromRGBO(0, 0, 0, 0.2),
//                                 ),
//                                 BoxShadow(
//                                   blurRadius: 3,
//                                   offset: Offset(-3, -3),
//                                   color: Color.fromRGBO(255, 255, 255, 1.0),
//                                 ),
//                               ])
//                         : BoxDecoration(
//                             color: const Color.fromRGBO(25, 25, 25, 1.0),
//                             borderRadius: BorderRadius.circular(3),
//                             boxShadow: const [
//                                 BoxShadow(
//                                   blurRadius: 5,
//                                   offset: Offset(5, 5),
//                                   color: Color.fromRGBO(18, 18, 18, 1.0),
//                                 ),
//                                 BoxShadow(
//                                   blurRadius: 3,
//                                   offset: Offset(-3, -5),
//                                   color: Color.fromRGBO(33, 33, 33, 1.0),
//                                 ),
//                               ]),
//                     child: Center(
//                         child: IconButton(
//                       onPressed: () {
//                         print("History button pressed");
//                         // storing the names
//                         String name = _findController.text.trim();
//                         if (name.isNotEmpty) {
//                           print("bypass condition");
//                           setState(() {
//                             _findController.text = "";
//                             search.add(name);
//                           });
//                         }
//                       },
//                       icon: Icon(
//                         Icons.history,
//                         size: 18,
//                       ),
//                       color: orange_color,
//                     ))),
//               ],
//             ),
//           ),
//           search.isEmpty
//               ? Center(child: Text("No data found"))
//               : Expanded(
//                   child: ListView.builder(
//                       itemCount: search.length,
//                       itemBuilder: (context, index) => getSearch(index)),
//                 ),
//         ],
//       ),
//     );
//   }
//
//   Widget getSearch(int index) {
//     return Card(
//       elevation: 2,
//       margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: (0.2).h),
//       child: ListTile(
//         onTap: () {},
//         title: Row(
//           children: [
//             Container(
//               width: (10.0).w,
//               child: Icon(Icons.history),
//             ),
//             Container(
//               width: (67.5).w,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   AutoSizeText(
//                     search[index],
//                     style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),
//                   ),
//                   IconButton(
//                       onPressed: () {
//                         setState(() {
//                           search.removeAt(index);
//                         });
//                       },
//                       icon: Icon(Icons.close)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         // trailing: IconButton(
//         //     onPressed: () {
//         //       setState(() {
//         //       search.removeAt(index);
//         //       });
//         //     },
//         //     icon: Icon(Icons.close)),
//         // leading: Icon(Icons.history),
//       ),
//     );
//   }
// }

//  List<String> data = ["Eminem", "Marshall", "Not affraid", "Lose Yourself", "Evil", "Vedant"];
// List<String> recentSearch = ["Eminem", "Marshall", "Not affraid", "Lose Yourself"];

// class SearchCustom extends SearchDelegate{

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // TODO: implement buildActions
//     return <Widget>[IconButton(onPressed: (){
//       query = "";
//     }, icon: Icon(Icons.clear))];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     // TODO: implement buildLeading
//     return IconButton(onPressed: (){
//       Navigator.pop(context);
//     }, icon: Icon(Icons.arrow_back_ios_new_rounded));
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     // TODO: implement buildResults
//     if(query != null && data.contains(query.toLowerCase())){
//       return ListTile(
//         title: Text(query),
//         onTap: () {},
//       );
//     }
//     else{
//       return Center(child: Text("No result Found"));
//     }
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // TODO: implement buildSuggestions
//     return ListView.builder(
//       itemCount: recentSearch.length,
//       itemBuilder: (context, index){
//       return Card(
//         margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: (0.2).h),
//         child: ListTile(
//           title: Text(recentSearch[index],style: TextStyle(fontWeight: FontWeight.w300),),
//           trailing: IconButton(onPressed: (){

//           }, icon: Icon(Icons.close_rounded)),
//           leading: Icon(Icons.history),
//           onTap: (){},
//         ),
//       );
//     });
//   }

// }
