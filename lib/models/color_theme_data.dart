import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum status { dark, light } //hatırlamak icin yazdım oylesine kodla alakası yok

class ColorThemeData with ChangeNotifier {
  final ThemeData _greenTheme = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green, //yesil ve yesilin tonları,
    scaffoldBackgroundColor: Colors.green,
    accentColor: Colors.green,
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.green,
    ),
  );
  final ThemeData _redTheme = ThemeData(
    primaryColor: Colors.red,
    primarySwatch: Colors.red, //yesil ve yesilin tonları,
    scaffoldBackgroundColor: Colors.red,
    accentColor: Colors.red,
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.red,
    ),
  );
  final ThemeData _orangeTheme = ThemeData(
    primaryColor: Colors.orangeAccent,
    //yesil ve yesilin tonları,
    scaffoldBackgroundColor: Colors.orangeAccent,
    accentColor: Colors.orangeAccent,
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.orangeAccent),
      headline3: TextStyle(color: Colors.orangeAccent),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.orangeAccent,
    ),
  );

  ThemeData _selectedThemeData = ThemeData(
    primaryColor: Colors.green,
    primarySwatch: Colors.green, //yesil ve yesilin tonları,
    scaffoldBackgroundColor: Colors.green,
    accentColor: Colors.green,
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.white),
      headline3: TextStyle(color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      color: Colors.green,
    ),
  );
  bool _isGreen = true;

  static late SharedPreferences _sharedPreferences;

  void switchTheme(bool selected) {
    //print(selected);
    _isGreen = selected;
    saveThemeToSharedPref(selected);
    notifyListeners();
  }

  ThemeData get SelectedThemeData => _isGreen ? _greenTheme : _redTheme;
  bool get isGreen => _isGreen;

  void buttomswitch() {
    _selectedThemeData = _orangeTheme;
    notifyListeners();
  }

  Future<void> createPrefObject() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value) {
    _sharedPreferences.setBool("themeData", value);
  }

  void loadThemeFromSharedPref() {
    _isGreen = _sharedPreferences.getBool("themeData") ?? true;
  }
}
