import 'package:comment_box/comment/comment.dart';
import 'package:flutter/material.dart';

Widget commentChild(data) {
  return ListView.builder(
      itemCount: data.length,
      itemBuilder: (ctx, index) {
        return Padding(
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
                        imageURLorPath: data[index].picture)),
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
      );
});
}