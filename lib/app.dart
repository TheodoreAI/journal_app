import '../screens/welcome.dart';
import 'package:journal_app/screens/new_entry.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  late bool boolTheme;

  @override
  void initState() {
    super.initState();
    boolTheme = false;
    initAppTheme();
  }

  void initAppTheme() async {
    // Try reading data from the 'repeat' key. If it doesn't exist, returns null
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      boolTheme = prefs.getBool('appThemeBool') ?? false;
    });
  }

  changeTheme() {
    if (boolTheme == true) {
      return ThemeData.dark();
    } else {
      return ThemeData.light();
    }
  }

  updateTheme(bool value) async {
    setState(() {
      boolTheme = !boolTheme;
    });
    // Obtain shared preferences.
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('appThemeBool', boolTheme);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        NewEntry.routeName: (context) => const NewEntry(),
        Welcome.routeName: (context) =>
            Welcome(updateTheme: updateTheme, booleanLight: boolTheme),
      },
      theme: changeTheme(),
    );
  }
}
