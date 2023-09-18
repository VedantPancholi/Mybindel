import 'package:flutter/material.dart';
import 'package:mybindel_test/models/Friend.dart';

class World_Of_FriendsProvider extends ChangeNotifier{

 final List<Friend> _friends = [
    Friend(
        name: 'World Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
    
    Friend(
        name: 'World Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
    
    Friend(
        name: 'World Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
    
    Friend(
        name: 'World Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
    
    Friend(
        name: 'World Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
    
    Friend(
        name: 'World Of Frinds',
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
