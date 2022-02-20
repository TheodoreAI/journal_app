import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../models/journal_entry.dart';

class JournalEntryForm extends StatefulWidget {
  const JournalEntryForm({Key? key}) : super(key: key);

  @override
  State<JournalEntryForm> createState() => _JournalEntryFormState();
}

class _JournalEntryFormState extends State<JournalEntryForm> {
  // Form Key
  final formKey = GlobalKey<FormState>();
  // Instance of DTO
  final journalEntryValue = JournalEntryFields();
  // Instance of the database

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(10), child: formContent());
  }

  Widget formContent() {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          titleTextField(),
          bodyTextField(),
          ratingDropDown(),
          const SizedBox(height: 10),
          saveButton(),
          cancelButton()
        ],
      ),
    );
  }

  Widget titleTextField() {
    return TextFormField(
      autofocus: true,
      decoration: const InputDecoration(
          labelText: 'Title', border: OutlineInputBorder()),
      onSaved: (value) {
        // store value in an object
        journalEntryValue.title = value;
        // Save in a database here
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter a Title';
        } else {
          return null;
        }
      },
    );
  }

  Widget bodyTextField() {
    return TextFormField(
      autofocus: true,
      decoration: const InputDecoration(
          labelText: 'Body', border: OutlineInputBorder()),
      onSaved: (value) {
        // store value in an object
        journalEntryValue.title = value;
        // Save in a database here
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter a Body';
        } else {
          return null;
        }
      },
    );
  }

  Widget ratingDropDown() {
    return TextFormField(
      autofocus: true,
      decoration: const InputDecoration(
          labelText: 'Rating', border: OutlineInputBorder()),
      onSaved: (value) {
        // store value in an object
        journalEntryValue.title = value;
        // Save in a database here
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter a Rating';
        } else {
          return null;
        }
      },
    );
  }

  Widget saveButton() {
    return ElevatedButton(
      child: const Text('Save'),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          // Development delete the file
          await deleteDatabase('journal.db');
          final Database database = await openDatabase('journal.db', version: 1,
              onCreate: (Database db, int version) async {
            await db.execute(
                'CREATE TABLE IF NOT EXISTS journal_entries(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL, body TEXT NOT NULL, rating INTEGER NOT NULL, date TEXT NOT NULL);');
          });

          await database.transaction((txn) async {
            await txn.rawInsert(
                'INSERT INTO journal_entries(title, body, rating, date) VALUES(?, ?, ?, ?)',
                [
                  journalEntryValue.title,
                  journalEntryValue.body,
                  journalEntryValue.rating,
                  journalEntryValue.dateTime
                ]);
          });

          await database.close();
          addDateToJournalEntryValue();
          Navigator.of(context).pop();
        }
        print('not valid');
      },
    );
  }

  Widget cancelButton() {
    return ElevatedButton(
      child: const Text('Cancel'),
      onPressed: () {
        print('Cancelled!');
      },
    );
  }

  void addDateToJournalEntryValue() {
    journalEntryValue.dateTime = DateTime.now();
  }
}
