import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/src/shared_pref/user_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings';
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondaryColor = false;
  int _gender = 1;
  String _name = 'Ernesto';

  TextEditingController? _textController;

  final prefs = UserPrefs();

  @override
  void initState() {
    super.initState();
    prefs.lastPage = SettingsPage.routeName;
    _gender = prefs.genre;
    _secondaryColor = prefs.secondaryColor;
    _textController = TextEditingController(text: prefs.name);
  }

  _setSelectedRadio(int value) {
    prefs.genre = value;
    setState(() {
      _gender = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
        title: const Text('Settings'),
      ),
      drawer: const MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(5.0),
            child: const Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          SwitchListTile(
            title: const Text('Secondary color'),
            value: _secondaryColor,
            onChanged: (value) {
              _secondaryColor = value;
              prefs.secondaryColor = value;
              setState(() {});
            },
          ),
          RadioListTile(
            title: const Text('Male'),
            value: 1,
            groupValue: _gender,
            onChanged: (value) => _setSelectedRadio(value!),
          ),
          RadioListTile(
            title: const Text('Female'),
            value: 2,
            groupValue: _gender,
            onChanged: (value) => _setSelectedRadio(value!),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  labelText: 'Name', helperText: 'Name of person'),
              onChanged: (value) {
                prefs.name = value;
              },
            ),
          )
        ],
      ),
    );
  }
}
