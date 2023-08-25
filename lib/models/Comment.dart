
enum Reaction { like, laugh, love, none }

class Singelcomment {
  String picture;
  String name;
  String text;
  String datetime;
  Reaction reaction;

  Singelcomment(
      {required this.picture,
        required this.name,
        required this.text,
        required this.datetime,
        required this.reaction});
}

