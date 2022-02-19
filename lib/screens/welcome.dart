import 'package:flutter/material.dart';
import 'package:journal_app/screens/new_entry.dart';

class Welcome extends StatelessWidget {
  static const routeName = '/';

  const Welcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Make sure the arguments sent from one screen to another match the type

    return Scaffold(
        appBar: AppBar(
          title: Text('Journal App'),
        ),
        body: Center(
            child: Column(children: [
          Text('Welcome', style: Theme.of(context).textTheme.headline4),
          button(context)
        ])));
  }

  Widget button(BuildContext context) {
    return ElevatedButton(
        child: const Text('Journal Form'),
        onPressed: () {
          displayWelcome(context);
        });
  }

  void displayWelcome(BuildContext context) {
    Navigator.of(context).pushNamed(NewEntry.routeName);
  }
}
