
import 'package:flutter/material.dart';
import 'package:mybindel_test/models/Friend.dart';


class Group_of_friendsProvider extends ChangeNotifier{

  final List<Friend> _friends = [
    Friend(
        name: 'Group Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
   
    Friend(
        name: 'Group Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
   
    Friend(
        name: 'Group Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
   
    Friend(
        name: 'Group Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
   
    Friend(
        name: 'Group Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
   
    Friend(
        name: 'Group Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
   
    Friend(
        name: 'Group Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
   
  ];

    List<Friend> get getItem => _friends;

  addItem(value){
    _friends.add(value);
    notifyListeners();
  }

  removeItem(index){
    _friends.removeAt(index);
    notifyListeners();
  }
}
