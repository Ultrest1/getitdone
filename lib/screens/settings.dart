import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:getfit/models/color_theme_data.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text('tema secimi yapınız'),
      ),
      body: SwitchCard(),
    );
  }
}

class SwitchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool _value = Provider.of<ColorThemeData>(context).isGreen;
    Text greenText = Text(
      "Green",
      style: TextStyle(color: Colors.green),
    );
    Text redText = Text(
      "Red",
      style: TextStyle(color: Colors.red),
    );

    return Column(
      children: [
        Card(
          child: SwitchListTile(
            subtitle: _value ? greenText : redText,
            title: Text('Change Theme Color',
                style: TextStyle(color: Colors.black)),
            value: _value,
            onChanged: (bool value) {
              print(value);
              Provider.of<ColorThemeData>(context, listen: false)
                  .switchTheme(value);
            },
          ),
        ),
        ElevatedButton(
            onPressed: () {},
            child: Text("dark mode"),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            )),
        ElevatedButton(
            onPressed: () {
              Provider.of<ColorThemeData>(context, listen: false)
                  .buttomswitch();
            },
            child: Text("light mode"),
            style: ElevatedButton.styleFrom(
              primary: Colors.purple,
            ))
      ],
    );
  }
}
