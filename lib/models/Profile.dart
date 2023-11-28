import 'Feed.dart';

class Profile {
  int id;
  String name;
  String nickname;
  String coverpicture;
  String picture;
  String occupation;
  String discription;
  List<Post> posts;
  Profile(
      {required this.id,
        required this.name,
        required this.nickname,
        required this.coverpicture,
        required this.picture,
        required this.occupation,
        required this.discription,
        required this.posts});
}
