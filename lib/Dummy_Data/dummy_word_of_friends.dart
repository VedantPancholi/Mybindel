import 'package:flutter/material.dart';
import 'package:mybindel_test/models/Word_Of_Friends.dart';

class Word_Of_FriendsProvider extends ChangeNotifier{

  final List<Word_Of_Friends> _locations = [

    Word_Of_Friends(name: 'Word Of Frinds', picture: "asset/music_icons/music_bg.png"),
    Word_Of_Friends(name: 'Word Of Frinds', picture: "asset/music_icons/music_bg.png"),
    Word_Of_Friends(name: 'Word Of Frinds', picture: "asset/music_icons/music_bg.png"),
    Word_Of_Friends(name: 'Word Of Frinds', picture: "asset/music_icons/music_bg.png"),
    Word_Of_Friends(name: 'Word Of Frinds', picture: "asset/music_icons/music_bg.png"),
    Word_Of_Friends(name: 'Word Of Frinds', picture: "asset/music_icons/music_bg.png"),
    Word_Of_Friends(name: 'Word Of Frinds', picture: "asset/music_icons/music_bg.png"),
    Word_Of_Friends(name: 'Word Of Frinds', picture: "asset/music_icons/music_bg.png"),
  ];

    List<Word_Of_Friends> get getItem => _locations;

  addItem(value){
    _locations.add(value);
    notifyListeners();
  }

  removeItem(index){
    _locations.removeAt(index);
    notifyListeners();
  }
}
