import 'package:flutter/material.dart';
import 'package:journal_app/screens/welcome.dart';
import 'package:journal_app/screens/new_entry.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  static final routes = {
    NewEntry.routeName: (context) => const NewEntry(),
    Welcome.routeName: (context) => const Welcome(),
  };

  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, routes: routes);
  }
}
