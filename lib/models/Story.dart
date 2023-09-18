import 'package:mybindel_test/models/User.dart';

enum MediaType { image, video }

class Story {
  String url;
  MediaType mediaType;
  bool isliked;

  Story({required this.url, required this.mediaType, this.isliked = false});
}

class singleUserStory {
  User user;
  List<Story> stories;
  singleUserStory({required this.user, required this.stories});
}
