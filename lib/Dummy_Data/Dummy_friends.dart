import '../models/Friend.dart';

class Friends {
  List<Friend> friends = [
    Friend(
      name: "Ram",
      occupation: 'Archer',
      picture: 'asset/images/user_logo.png',
    ),
    Friend(
      name: "Shyam",
      occupation: 'Artist',
      picture: 'asset/images/user_logo.png',
    ),
    Friend(
      name: "Shiv",
      occupation: 'Monk',
      picture: 'asset/images/user_logo.png',
    ),
    Friend(
      name: "Surya",
      occupation: 'Cricketer',
      picture: 'asset/images/user_logo.png',
    ),
  ];

  List<Friend> blockedfriends = [];
  List<Friend> mutedfriends = [];

  List<Friend> get getfriends {
    return friends;
  }

  List<Friend> get getblockedfriends {
    return blockedfriends;
  }

  List<Friend> get getmutedfriends {
    return mutedfriends;
  }



  void addtoBlockList(index , bool ismuted){
    if (ismuted)
      {
        blockedfriends.add(mutedfriends[index]);
        mutedfriends.removeAt(index);
      }
    else{
      blockedfriends.add(friends[index]);
      friends.removeAt(index);
    }

  }

  void addtoMuteList(index){
    mutedfriends.add(friends[index]);
    friends.removeAt(index);
  }

  void removefromMuteList(index){
    friends.add(mutedfriends[index]);
    mutedfriends.removeAt(index);
  }

  void removefromBlockList(index){
    friends.add(blockedfriends[index]);
    blockedfriends.removeAt(index);
  }


}


Friends friendobj = Friends();
Friends getfriendobj() {
  return friendobj;
}