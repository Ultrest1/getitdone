import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final bool isDone;
  final Function(bool?) toggleStatuss;
  void Function(DismissDirection)? deleteItem;
  void Function()? onLongPress;

  ItemCard({
    required this.title,
    required this.isDone,
    required this.toggleStatuss,
    required this.deleteItem,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      //otomatik key degeri
      key: UniqueKey(),
      //onLongPress: onLongPress,
      onDismissed: deleteItem,
      child: Card(
        color: isDone ? Colors.redAccent.shade100 : Colors.blue,
        // elevation: isDone ? 5 : 1,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: ListTile(
          title: Text(
            "$title",
            style: TextStyle(
                color: Colors.black,
                decoration: isDone ? TextDecoration.lineThrough : null),
          ),
          trailing: Checkbox(
            onChanged: toggleStatuss,
            value: isDone,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
