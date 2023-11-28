
enum Reaction { like, laugh, love, none }

class Singelcomment {
  String picture;
  String name;
  String text;
  String datetime;
  Reaction reaction;
  List<Singelcomment> replies;

  Singelcomment(
      {required this.picture,
        required this.name,
        required this.text,
        required this.datetime,
        required this.reaction,
        required this.replies
      });
}

