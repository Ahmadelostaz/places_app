import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:untitled8/helpers/DBhelpers.dart';

import '../models/place.dart';
import '../helpers/DBhelpers.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(File image, String title) {
    final place = Place(
        location: null,
        image: image,
        title: title,
        id: DateTime.now().toString());
    _items.add(place);
    DBhelper.insert('user_places',
        {'id': place.id, 'title': place.title, 'image': place.image.path});
    notifyListeners();
  }

  Future<void> fetchAndSetPlaces() async {
    final dbData = await DBhelper.getData('user_places');
    List<Place> db = dbData
        .map((e) => Place(
            id: e['id'],
            title: e['title'],
            location: null,
            image: File(e['image'])))
        .toList();
    _items = db;
  }
}
