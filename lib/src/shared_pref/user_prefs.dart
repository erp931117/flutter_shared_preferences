import 'package:shared_preferences/shared_preferences.dart';

class UserPrefs {
  static final UserPrefs _instance = UserPrefs._internal();

  factory UserPrefs() {
    return _instance;
  }

  UserPrefs._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // GET and SET of genre
  int get genre {
    return _prefs.getInt('genre') ?? 1;
  }

  set genre(int value){
    _prefs.setInt('genre', value);
  }

  // GET and SET of secondary color
  bool get secondaryColor {
    return _prefs.getBool('secondaryColor') ?? false;
  }

  set secondaryColor(bool value){
    _prefs.setBool('secondaryColor', value);
  }

  // GET and SET of name
  String get name {
    return _prefs.getString('name') ?? 'Ernesto';
  }

  set name(String value){
    _prefs.setString('name', value);
  }

  // GET and SET of last page
  String get lastPage {
    return _prefs.getString('lastPage') ?? 'home';
  }

  set lastPage(String value){
    _prefs.setString('lastPage', value);
  }
}
