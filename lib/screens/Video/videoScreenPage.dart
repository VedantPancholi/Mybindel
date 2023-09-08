// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mybindel_test/screens/Video/WatchHistory.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'package:mybindel_test/palette/palette.dart';
import 'package:mybindel_test/screens/Video/VideoSingle_item.dart';

import '../../providers/selectTheme.dart';

class VideoScreenPage extends StatefulWidget {
  const VideoScreenPage({super.key});

  @override
  State<VideoScreenPage> createState() => _VideoScreenPageState();
}

class _VideoScreenPageState extends State<VideoScreenPage> {

  bool onWatchHistory = false;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor:
            provider.currentTheme ? light_Scaffold_color : dark_Scaffold_color,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((BuildContext context) =>
                                    SearchScreen())));
                      },
                      child: Container(
                        width: (75.0).w,
                        height: 6.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                        ),
                        margin: EdgeInsets.symmetric(
                            // vertical: ().h * 0.010,
                            horizontal: (3.00).w),
                        decoration: provider.currentTheme
                            ? textFormField_neu_morphism
                            : dark_textFormField_neu_morphism,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText("Search Videos")),
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
                            setState(() {
                              onWatchHistory = !onWatchHistory;
                            });
                            // Navigator.push(context, custompageroute(child: StoryCreationPage()));
                          },
                          icon: Icon(
                            Icons.access_time_sharp,
                            color: onWatchHistory == true ? orange_color : Colors.grey.shade800,
                            size: 25,
                          )),
                    )
                  ],
                ),
              ),
              onWatchHistory == true 
              ? WatchHistory()
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (ctx, index) {
                    print("LISTVIEW...................");
                    return VideoSingle_item(index);
                  })
            ],
          ),
        ));
  }

  // Widget _search(String value) {
  //   return ;

  // }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Search> search = List.empty(growable: true);
  TextEditingController _findController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.0.w, vertical: 1.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    width: size.width * 0.080,
                    height: size.height * 0.040,
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
                        Navigator.pop(context);
                      },
                    )),
                SizedBox(
                  width: size.width * 0.030,
                ),
                Container(
                  width: size.width * 0.700,
                  height: size.height * 0.050,
                  decoration: provider.currentTheme
                      ? textFormField_neu_morphism
                      : dark_textFormField_neu_morphism,
                  child: TextFormField(
                    autocorrect: true,
                    autofocus: true,
                    controller: _findController,
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
                  width: size.width * 0.030,
                ),
                Container(
                    width: size.width * 0.090,
                    height: size.height * 0.040,
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
                        if (name.isNotEmpty ) {
                          print("bypass condition");
                          setState(() {
                            _findController.text = "";
                            search.add(Search(name: name));
                          });
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
      ),
    );
  }

  Widget getSearch(int index) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: (0.2).h),
      child: ListTile(
        onTap: (){},
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
                  AutoSizeText(search[index].name,style: TextStyle(fontWeight: FontWeight.w300, fontSize: 17),),
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
}

class Search {
  String name;
  Search({
    required this.name,
  });
}

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


