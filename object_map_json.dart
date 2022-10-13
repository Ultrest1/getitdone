import 'dart:convert';

main() {
  Item itemObject = Item(title: 'uyu', isDone: true);
  print('itemobject :+ $itemObject');
  print('itemobject :+ ${itemObject.runtimeType}');

  Map itemAsMap = itemObject.toMap();
  print('itemobject ->+ $itemAsMap');
  print('itemobject ->+ ${itemAsMap.runtimeType}');

  String itemAsJson = json.encode(itemAsMap);

  print('itemobject ->+ $itemAsJson');
  print('itemobject ->+ ${itemAsJson.runtimeType}');

  ///////////////////////////////////////////////////////////////
  print('-----------------------------------------------------');

  itemAsMap = json.decode(itemAsJson);
  //itemObject = Item(title: itemAsMap['title'], isDone: itemAsMap['isDone']);
  print('itemobject ->+ $itemObject');
  print('itemobject ->+ ${itemObject.runtimeType}');
  ///////////////////////////////////////////////////////////////
  print('-----------------------------------------------------');

  itemAsMap = json.decode(itemAsJson);
  //itemObject = Item(title: itemAsMap['title'], isDone: itemAsMap['isDone']);
  itemObject = Item.fromMap(itemAsMap);
  print('itemobject ->+ $itemObject');
  print('itemobject ->+ ${itemObject.runtimeType}');
}

class Item {
  String title;
  bool isDone;
  Item({required this.title, required this.isDone});
  Item.fromMap(Map<dynamic, dynamic> map)
      : title = map['title'],
        isDone = map['isDone']; //buda isimli yapıcı

  Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};
}
