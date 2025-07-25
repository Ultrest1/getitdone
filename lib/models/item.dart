class Item {
  final String title;
  bool isDone;

  Item({required this.title, this.isDone = false});

  void toggleStatus() {
    isDone = !isDone;
  }

  Item.fromMap(Map<dynamic, dynamic> map)
      : title = map['title'],
        isDone = map['isDone']; //buda isimli yapıcı

  Map<String, dynamic> toMap() => {'title': title, 'isDone': isDone};
}
