import 'package:flutter/material.dart';

import '../models/Friend.dart';

class World_Of_FriendsProvider extends ChangeNotifier {
  final List<Friend> _friends = [
    Friend(
        id: 1,
        name: 'World Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
    Friend(
        id: 2,
        name: 'World Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
    Friend(
        id: 3,
        name: 'World Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
    Friend(
        id: 4,
        name: 'World Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
    Friend(
        id: 5,
        name: 'World Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
    Friend(
        id: 6,
        name: 'World Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
    Friend(
        id: 7,
        name: 'World Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
    Friend(
        id: 8,
        name: 'World Of Frinds',
        picture: "asset/music_icons/music_bg.png",
        occupation: 'Artist'),
  ];

  List<Friend> get getItem => _friends;

  addItem(value) {
    _friends.add(value);
    notifyListeners();
  }

  removeItem(index) {
    _friends.removeAt(index);
    notifyListeners();
  }
}
