import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todouygulamasi/models/items_database.dart';

class ItemAdder extends StatelessWidget {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                minLines: 1,
                maxLines: 3,
                controller: textController,
                // onChanged: (input) {
                //   print(textController.text);
                // },
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'add item',
                  hintText: '...',
                ),
                autofocus: true,
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<ItemDataBase>(context, listen: false)
                      .addItem(textController.text);
                  Navigator.pop(context);
                },
                child: Text("Add"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
