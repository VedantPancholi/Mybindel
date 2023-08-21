import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/selectTheme.dart';

Widget commentChild(data,context) {
  final provider = Provider.of<Themeprovider>(context);
  final size = MediaQuery.of(context).size;
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (ctx, index) {
        return Card(
          margin: EdgeInsets.only(top: size.height*0.020,left: size.width*0.010,right: size.width*0.010),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(20)
          // ),
          color: provider.currentTheme ? Colors.grey.shade100 : Colors.grey.shade800,
          elevation: 3.0,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 8.0, 2.0, 0.0),
                child: ListTile(
                  leading: GestureDetector(
                    onTap: () async {
                      // Display the image in large form.
                      print("Comment Clicked ${index}");
                    },
                    child: Container(
                      height: 50.0,
                      width: 50.0,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: CircleAvatar(
                          radius: 50,
                          backgroundImage: CommentBox.commentImageParser(
                              imageURLorPath: data[index].picture),
                      ),
                    ),
                  ),
                  title: Text(
                    data[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(data[index].text),
                  trailing:
                  Text(data[index].datetime, style: TextStyle(fontSize: 10)),
                ),
              ),
              Container(
                color: Colors.amber,
                width: size.width,
                height: size.height*0.050,
                // decoration: BoxDecoration(
                //   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                // ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //reaction
                    Container(
                      color: Colors.orange,
                      width: size.width*0.30,
                    ),
                    //reply
                    Container(
                      color: Colors.deepOrange,
                      width: size.width*0.55,
                    ),

                  ],
                ),
              ),
            ],
          ),
        );
});
}