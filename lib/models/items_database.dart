import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:getfit/models/item.dart';

class ItemDataBase with ChangeNotifier {
  final List<Item> _items = [
    // Item(title: '1.gorev'),
    // Item(title: '2.gorev'),
    // Item(title: '3.gorev'),
    // Item(title: '4.gorev'),
    // Item(title: '5.gorev'),
  ];

  static late SharedPreferences _sharedPref;
  List<String> _itemsAsString = [];

  void toggleStatus(int index) {
    _items[index].toggleStatus();
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void addItem(String title) {
    _items.add(Item(title: title));
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    saveItemsToSharedPref(_items);
    notifyListeners();
  }

  UnmodifiableListView<Item> get items => //yeni dokumanda boyle yazıyor
      UnmodifiableListView(_items); //orjinali gitmeyecek

  ///shared pref methodlari

  Future<void> createPrefObject() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  void saveItemsToSharedPref(List<Item> items) {
    ///List<Item> --> List<String > cevirsin
    _itemsAsString.clear();
    for (var item in items) {
      _itemsAsString.add(json.encode(item.toMap())); //String oldu
    }

    ///sharedprefere kaydetsin
    _sharedPref.setStringList("toDoData", _itemsAsString);
  }

  void loadItemsFromSharedPref() {
    List<String> tempList = _sharedPref.getStringList('toDoData') ?? [];
    _items.clear();
    for (var item in tempList) {
      _items.add(Item.fromMap(json.decode(item)));
    }
  }
}
