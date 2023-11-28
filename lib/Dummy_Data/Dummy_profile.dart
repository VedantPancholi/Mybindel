import '../models/Comment.dart';
import '../models/Feed.dart';
import '../models/Profile.dart';

class Profiles {
  List<Profile> profiles = [
    Profile(
        id:1,
        name: 'Ram',
        nickname: 'Nobody',
        coverpicture: 'asset/images/user_post.png',
        picture: 'asset/images/user_post.png',
        occupation: 'Archer',
        discription: 'If you ever get tired, then tell us,\nW\'ll lift you up in our arms, \nIf you fall in love with us once,\nWe will spread happiness in your path.',
        posts: [
          Post(
              picture: 'asset/images/user_logo.png',
              name: 'Ram',
              occupation: 'Archer',
              image: 'asset/images/user_post.png',
              caption: 'Created with love, crafted with intelligence.',
              likesCount: '11k',
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
              name: 'Ram',
              occupation: 'Archer',
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
          Post(
              picture: 'asset/images/user_logo.png',
              name: 'Ram',
              occupation: 'Archer',
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
        ]),
    Profile(
        id:2,
        name: 'Shyam',
        nickname: 'Nobody',
        coverpicture: 'asset/images/user_post.png',
        picture: 'asset/images/user_post.png',
        occupation: 'Artist',
        discription: 'DISCRIPTION1',
        posts: [
          Post(
              picture: 'asset/images/user_logo.png',
              name: 'Shyam',
              occupation: 'ARTIST',
              image: 'asset/images/user_post.png',
              caption: 'Created with love, crafted with intelligence.',
              likesCount: '11k',
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
              name: 'Shyam',
              occupation: 'Artist',
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
        ]),
    Profile(
        id: 3,
        name: 'Shiv',
        nickname: 'Nobody',
        coverpicture: 'asset/images/user_post.png',
        picture: 'asset/images/user_post.png',
        occupation: 'MONK',
        discription: 'DISCRIPTION1',
        posts: [
          Post(
              picture: 'asset/images/user_logo.png',
              name: 'Shiv',
              occupation: 'MONK',
              image: 'asset/images/user_post.png',
              caption: 'Created with love, crafted with intelligence.',
              likesCount: '11k',
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
              name: 'Shiv',
              occupation: 'MONK',
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
        ]),
    Profile(
        id: 4,
        name: 'Surya',
        nickname: 'Nobody',
        coverpicture: 'asset/images/user_post.png',
        picture: 'asset/images/user_post.png',
        occupation: 'Cricketer',
        discription: 'DISCRIPTION1',
        posts: [
          Post(
              picture: 'asset/images/user_logo.png',
              name: 'Surya',
              occupation: 'Cricketer',
              image: 'asset/images/user_post.png',
              caption: 'Created with love, crafted with intelligence.',
              likesCount: '11k',
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
              name: 'Surya',
              occupation: 'Cricketer',
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
        ]),

  ];

  Profile getprofile(int id ){
    return profiles.firstWhere((element) => element.id == id);
  }

  void changeReaction(reaction, profileId ,postIndex, commentIndex, replyIndex) {
    if (replyIndex != null) {
      getprofile(profileId).posts[postIndex].comments[commentIndex].replies[replyIndex].reaction = reaction;
    }
    else {
      getprofile(profileId).posts[postIndex].comments[commentIndex].reaction = reaction;
    }
  }

  Reaction getReaction(profileId, postIndex, commentIndex, replyIndex) {
    //print(  feeds[reelIndex].comments[commentIndex].reaction);
    if (replyIndex != null) {
      return getprofile(profileId).posts[postIndex].comments[commentIndex].replies[replyIndex].reaction;
    } else {
      return getprofile(profileId).posts[postIndex].comments[commentIndex].reaction;
    }
  }

}

Profiles profileobj = Profiles();
Profiles getprofileobj() {
  return profileobj;
}
