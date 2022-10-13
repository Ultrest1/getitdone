import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todouygulamasi/models/color_theme_data.dart';
import 'package:todouygulamasi/models/items_database.dart';
import 'package:todouygulamasi/screens/home_page.dart';

import 'models/color_theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ColorThemeData().createPrefObject();
  await ItemDataBase().createPrefObject();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ItemDataBase>(
        create: (BuildContext context) => ItemDataBase()),
    ChangeNotifierProvider<ColorThemeData>(
      create: (BuildContext context) => ColorThemeData(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provider.of<ColorThemeData>(context).loadThemeFromSharedPref();
    // Provider.of<ItemDataBase>(context).loadItemsFromSharedPref();

    return Consumer2<ItemDataBase, ColorThemeData>(
        builder: (context, ItemDataBasee, ColorThemeDataa, child) {
      //alt widgetler icin kullanılır
      ItemDataBasee.loadItemsFromSharedPref();
      ColorThemeDataa.loadThemeFromSharedPref();
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ColorThemeData>(context).SelectedThemeData,
        home: SplashWidget(),
      );
    });
  }
}

class SplashWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.network(
          'https://cdn.dsmcdn.com/ty81/product/media/images/20210306/9/69258509/94038034/1/1_org_zoom.jpg'),
      title: Text(
        "Get it Done",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      showLoader: true,
      loadingText: Text("Loading..."),
      navigator: HomePage(),
      durationInSeconds: 8,
    );
  }
}
