
import 'package:flutter/material.dart';
import 'package:mybindel_test/models/Group_of_friends.dart';


class Group_of_friendsProvider extends ChangeNotifier{

  final List<Group_Of_Friends> _Group_Of_Friends = [

    Group_Of_Friends(name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png"),
    Group_Of_Friends(name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png"),
    Group_Of_Friends(name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png"),
    Group_Of_Friends(name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png"),
    Group_Of_Friends(name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png"),
    Group_Of_Friends(name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png"),
    Group_Of_Friends(name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png"),
    Group_Of_Friends(name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png"),
  ];

    List<Group_Of_Friends> get getItem => _Group_Of_Friends;

  addItem(value){
    _Group_Of_Friends.add(value);
    notifyListeners();
  }

  removeItem(index){
    _Group_Of_Friends.removeAt(index);
    notifyListeners();
  }
}
