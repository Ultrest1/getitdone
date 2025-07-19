import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:getfit/models/items_database.dart';
import 'package:getfit/screens/settings.dart';

import '../widgets/items_card.dart';
import 'item_adder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingsPage()));
              },
              icon: Icon(
                Icons.settings,
                size: 30,
              )),
        ],
        centerTitle: true,
        title: Text(
          "get it done",
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) => ItemAdder(),
          );
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '${Provider.of<ItemDataBase>(context).items.length} items',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Consumer<ItemDataBase>(
                      builder: (context, ItemDatabase, child) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: ListView.builder(
                            shrinkWrap: true,
                            reverse: true,
                            itemCount: ItemDatabase.items.length,
                            itemBuilder: (context, index) {
                              return ItemCard(
                                  title:
                                      ItemDatabase //boylede kullanılabilir consumer widget oldugu icin
                                          .items[index]
                                          .title,
                                  isDone: Provider.of<ItemDataBase>(context)
                                      .items[index]
                                      .isDone,
//yeni eklendi
                                  deleteItem: (_) {
                                    Provider.of<ItemDataBase>(context,
                                            listen: false)
                                        .deleteItem(index);
                                  },
//yeni eklendi
                                  onLongPress: () {
                                    Provider.of<ItemDataBase>(context,
                                            listen: false)
                                        .deleteItem(index);
                                  },
                                  toggleStatuss: (_) {
                                    Provider.of<ItemDataBase>(context,
                                            listen: false)
                                        .toggleStatus(index);
                                  });
                            },
                          ),
                        );
                      },
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
