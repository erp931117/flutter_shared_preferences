import 'package:flutter/material.dart';
import 'package:flutter_shared_preferences/src/pages/home_page.dart';
import 'package:flutter_shared_preferences/src/pages/settings_page.dart';
import 'package:flutter_shared_preferences/src/shared_pref/user_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPrefs();
  await prefs.initPrefs();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = UserPrefs();
    return MaterialApp(
      title: 'Shared preferences',
      initialRoute: prefs.lastPage,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SettingsPage.routeName: (context) => const SettingsPage()
      },
    );
  }
}
