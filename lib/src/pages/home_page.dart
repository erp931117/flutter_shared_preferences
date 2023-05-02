import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/src/pages/settings_page.dart';
import 'package:flutter_shared_preferences/src/shared_pref/user_prefs.dart';
import 'package:flutter_shared_preferences/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = UserPrefs();
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    prefs.lastPage = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: (prefs.secondaryColor) ? Colors.teal : Colors.blue,
        title: const Text('Shared preferences'),
      ),
      drawer: const MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Secondary Color: ${prefs.secondaryColor}'),
          Divider(),
          Text('Genre: ${prefs.genre}'),
          Divider(),
          Text('Username: ${prefs.name}'),
          Divider()
        ],
      ),
    );
  }
}
