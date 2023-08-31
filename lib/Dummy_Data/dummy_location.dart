
import 'package:flutter/material.dart';
import 'package:mybindel_test/models/Location.dart';

class LocationsProvider extends ChangeNotifier{

  final List<Location> _locations = [

    Location(name: 'New York', picture: "asset/music_icons/music_bg.png"),
    Location(name: 'New York', picture: "asset/music_icons/music_bg.png"),
    Location(name: 'New York', picture: "asset/music_icons/music_bg.png"),
    Location(name: 'New York', picture: "asset/music_icons/music_bg.png"),
    Location(name: 'New York', picture: "asset/music_icons/music_bg.png"),
    Location(name: 'New York', picture: "asset/music_icons/music_bg.png"),
  ];

    List<Location> get getItem => _locations;

  addItem(value){
    _locations.add(value);
    notifyListeners();
  }

  removeItem(index){
    _locations.removeAt(index);
    notifyListeners();
  }
}
