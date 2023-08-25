import 'package:mybindel_test/models/feed.dart';
import '../models/Comment.dart';


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
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'naresh',
              text: 'ohh cool!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'cool_dude69',
              text: 'ohh!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'angel_priya',
              text: 'yehh!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'chacha_Choudhary',
              text: 'look amazing',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'vedant',
              text: 'ohh cool!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'raj',
              text: 'ohh!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'het',
              text: 'yehh!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'parth',
              text: 'look amazing',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none),
        ]),
    Reel(
        picture: 'asset/images/user_logo.png',
        name: 'Franklin S.',
        occupation: 'Doctor',
        image: 'asset/images/user_post.png',
        caption: 'Created with love, crafted with intelligence.',
        likesCount: '2k',
        commentsCount: '7',
        sharesCount: 3,
        views: '2300 ',
        comments: [
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'naresh',
              text: 'ohh cool!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'cool_dude69',
              text: 'ohh!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'angel_priya',
              text: 'yehh!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'chacha_Choudhary',
              text: 'look amazing',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none),
        ]),
  ];

  int i = 0;


  List<Reel> get getfeeds {
    return feeds;
  }

  void changeReaction(reaction , reelIndex , commentIndex){
    feeds[reelIndex].comments[commentIndex].reaction = reaction;
    print("set called");
    print(  feeds[reelIndex].comments[commentIndex].reaction);
  }

  Reaction getReaction(reelIndex , commentIndex){
    print("get called");
    //print(  feeds[reelIndex].comments[commentIndex].reaction);
    return feeds[reelIndex].comments[commentIndex].reaction;
  }

}


Feeds obj = Feeds();
Feeds getobj(){
  return obj;
}
