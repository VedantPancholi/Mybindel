// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:html';

import 'package:mybindel_test/models/User.dart';

enum MediaType {image, video}

class Story {
  String url;
  MediaType mediaType;
  User user;
  Location? location;
  bool isliked;

  Story({
    required this.url,
    required this.mediaType,
    required this.user,
    this.location,
    this.isliked = false
  });
}
