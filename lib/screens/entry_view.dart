import 'package:flutter/material.dart';

class EntryView extends StatelessWidget {
  static const routeName = 'entryview';
  final String title;
  final String body;

  const EntryView({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail view'),
      ),
      body: ListView(padding: const EdgeInsets.all(16.0), children: [
        Text(title,
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        Text(
          body,
          style: const TextStyle(fontSize: 20),
        )
      ]),
    );
  }

  Widget label(BuildContext context) {
    return Text('Entry View', style: Theme.of(context).textTheme.headline4);
  }

  Widget button(BuildContext context) {
    return ElevatedButton(
        child: const Text('Close'),
        onPressed: () {
          displayWelcome(context);
        });
  }

  void displayWelcome(BuildContext context) {
    Navigator.of(context).pop();
  }
}
