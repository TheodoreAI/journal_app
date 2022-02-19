import 'package:flutter/material.dart';
import 'package:journal_app/widgets/journal_entry_form.dart';

class NewEntry extends StatelessWidget {
  static const routeName = 'newentry';

  const NewEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Journal App')),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              label(context),
              button(context),
              const JournalEntryForm()
            ])));
  }

  Widget label(BuildContext context) {
    return Text('Journal Entry Form',
        style: Theme.of(context).textTheme.headline4);
  }

  Widget button(BuildContext context) {
    return ElevatedButton(
        child: const Text('Go Home'),
        onPressed: () {
          displayWelcome(context);
        });
  }

  void displayWelcome(BuildContext context) {
    Navigator.of(context).pop();
  }
}
