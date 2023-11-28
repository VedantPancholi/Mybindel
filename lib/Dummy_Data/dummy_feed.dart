import 'package:mybindel_test/models/Feed.dart';
import '../models/Comment.dart';

class Feeds {
  List<Post> feeds = [
    Post(
        picture: 'asset/images/user_logo.png',
        name: 'John David',
        occupation: 'ARTIST',
        image: 'asset/images/user_post.png',
        caption: 'Created with love, crafted with intelligence.',
        likesCount: '1k',
        commentsCount: '0',
        sharesCount: 12,
        views: '1500 ',
        comments: [
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'chacha_Choudhary',
              text: 'look amazing',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none,
              replies: []),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'cool_dude69',
              text: 'ohh!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none,
              replies: []),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'nariyo doffo',
              text: 'ohh cool!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none,
              replies: []),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'angel_priya',
              text: 'yehh!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none,
              replies: []),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'vedant',
              text: 'ohh cool!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none,
              replies: []),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'raj',
              text: 'ohh!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none,
              replies: []),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'het',
              text: 'yehh!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none,
              replies: []),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'parth',
              text: 'look amazing',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none,
              replies: []),
        ]),
    Post(
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
              reaction: Reaction.none,
              replies: []),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'cool_dude69',
              text: 'ohh!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none,
              replies: []),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'angel_priya',
              text: 'yehh!',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none,
              replies: []),
          Singelcomment(
              picture: 'asset/images/user_logo.png',
              name: 'chacha_Choudhary',
              text: 'look amazing',
              datetime: DateTime.now().toString(),
              reaction: Reaction.none,
              replies: []),
        ]),
  ];

  int i = 0;

  List<Post> get getfeeds {
    return feeds;
  }

  void changeReaction(reaction, profileId ,reelIndex, commentIndex, replyIndex) {
    if (replyIndex != null) {
      feeds[reelIndex].comments[commentIndex].replies[replyIndex].reaction =
          reaction;
      print(
          "oll  ${feeds[reelIndex].comments[commentIndex].replies[replyIndex].reaction}");
    } else {
      feeds[reelIndex].comments[commentIndex].reaction = reaction;
      print(feeds[reelIndex].comments[commentIndex].reaction);
    }
  }

  Reaction getReaction(profileId ,reelIndex, commentIndex, replyIndex) {
    //print(  feeds[reelIndex].comments[commentIndex].reaction);
    if (replyIndex != null) {
      return feeds[reelIndex].comments[commentIndex].replies[replyIndex].reaction;
    } else {
      return feeds[reelIndex].comments[commentIndex].reaction;
    }
  }
}

Feeds postobj = Feeds();
Feeds getpostobj() {
  return postobj;
}
