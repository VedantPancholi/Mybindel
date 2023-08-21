import 'package:mybindel_test/models/comment.dart';

class Reel {
  String picture;
  String name;
  String occupation;
  String image;
  String caption;
  String likesCount;
  String commentsCount;
  int sharesCount;
  String views;
  List<Singlecomment> comments;

  Reel(
      {
        required this.picture,
        required this.name,
        required this.occupation,
        required this.image,
        required this.caption,
        required this.likesCount,
        required this.commentsCount,
        required this.sharesCount,
        required this.views,
        required this.comments,
      });

}
