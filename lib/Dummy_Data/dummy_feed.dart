import 'package:mybindel_test/models/comment.dart';
import 'package:mybindel_test/models/feed.dart';


class Feeds {
  List<Reel> feeds = [
    Reel(
        picture: 'asset/images/user_logo.png',
        name: 'John David',
        occupation: 'ARTIST',
        image: 'asset/images/user_post.png',
        caption: 'Created with love, crafted with intelligence.',
        likesCount: '1k',
        commentsCount: '47',
        sharesCount: 12,
        views: '1500 ',
        comments: [
          Singlecomment(
              picture: 'asset/images/user_logo.png',
              name: 'Vrund',
              text: 'ohh cool!',
              datetime: DateTime.now().toString(),
              reaction: 0),
          Singlecomment(
              picture: 'asset/images/user_logo.png',
              name: 'Vedant',
              text: 'Man!!!',
              datetime: DateTime.now().toString(),
              reaction: 0),
          Singlecomment(
              picture: 'asset/images/user_logo.png',
              name: 'Maharshi',
              text: 'yehh!',
              datetime: DateTime.now().toString(),
              reaction: 0),
          Singlecomment(
              picture: 'asset/images/user_logo.png',
              name: 'Kadam',
              text: 'look amazing',
              datetime: DateTime.now().toString(),
              reaction: 0),
          Singlecomment(
              picture: 'asset/images/user_logo.png',
              name: 'raj',
              text: 'ohh!',
              datetime: DateTime.now().toString(),
              reaction: 0),
          Singlecomment(
              picture: 'asset/images/user_logo.png',
              name: 'het',
              text: 'yehh!',
              datetime: DateTime.now().toString(),
              reaction: 0),
          Singlecomment(
              picture: 'asset/images/user_logo.png',
              name: 'parth',
              text: 'look amazing',
              datetime: DateTime.now().toString(),
              reaction: 0),
        ]),
    Reel(
        picture: 'asset/images/franklin.png',
        name: 'Franklin S.',
        occupation: 'Doctor',
        image: 'asset/images/user_post2.png',
        caption: 'Created with love, crafted with intelligence.',
        likesCount: '2k',
        commentsCount: '7',
        sharesCount: 3,
        views: '2300 ',
        comments: [
          Singlecomment(
              picture: 'asset/images/user_logo.png',
              name: 'Vrund',
              text: 'ohh cool!',
              datetime: DateTime.now().toString(),
              reaction: 0),
          Singlecomment(
              picture: 'asset/images/user_logo.png',
              name: 'Vedant',
              text: 'Man!!!',
              datetime: DateTime.now().toString(),
              reaction: 0),
          Singlecomment(
              picture: 'asset/images/user_logo.png',
              name: 'Maharshi',
              text: 'yehh!',
              datetime: DateTime.now().toString(),
              reaction: 0),
          Singlecomment(
              picture: 'asset/images/user_logo.png',
              name: 'Kadam',
              text: 'look amazing',
              datetime: DateTime.now().toString(),
              reaction: 0),
        ]),
  ];

  int i = 0;

  List<Reel> get getfeeds {
    return feeds;
  }



}

