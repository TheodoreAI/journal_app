import 'package:journal_app/screens/welcome.dart';
import 'package:journal_app/screens/new_entry.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  // static final routes = {
  //   NewEntry.routeName: (context) => const NewEntry(),
  //   Welcome.routeName: (context) => Welcome(updateTheme: updateTheme),
  // };
  late final String boolTheme;
  void initState() {
    super.initState();
    boolTheme = 'dark';
  }

  void updateTheme() {
    setState(() {
      boolTheme = 'light';
    });
  }

  changeTheme() {
    if (boolTheme == 'dark') {
      return ThemeData.dark();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        NewEntry.routeName: (context) => const NewEntry(),
        Welcome.routeName: (context) => Welcome(updateTheme: updateTheme),
      },
      theme: changeTheme(),
    );
  }
}
