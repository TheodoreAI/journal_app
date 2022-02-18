import 'package:flutter/material.dart';
import 'package:journal_app/screens/welcome.dart';
import 'package:journal_app/widgets/journal_entry_form.dart';

class NewEntry extends StatelessWidget {
  static const routeName = '/';

  const NewEntry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Journal App')),
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
        child: const Text('Click Me!'),
        onPressed: () {
          displayAlpha(context);
        });
  }

  void displayAlpha(BuildContext context) {
    Navigator.of(context)
        .pushNamed(Welcome.routeName, arguments: 'Journal App');
  }
}
