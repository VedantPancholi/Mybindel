import 'package:flutter/material.dart';

import '../models/Friend.dart';


class Group_of_friendsProvider extends ChangeNotifier{

  final List<Friend> _friends = [

    Friend(id: 1, name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png",occupation: 'Artist'),
    Friend(id: 2,name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png",occupation: 'Artist'),
    Friend(id: 3,name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png",occupation: 'Artist'),
    Friend(id: 4,name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png",occupation: 'Artist'),
    Friend(id: 5,name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png",occupation: 'Artist'),
    Friend(id: 6,name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png",occupation: 'Artist'),
    Friend(id: 7,name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png",occupation: 'Artist'),
    Friend(id: 8,name: 'Group Of Friends', picture: "asset/music_icons/music_bg.png",occupation: 'Artist'),

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