import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../models/journal_entry.dart';
import 'package:flutter/services.dart';

const BUILD_TABLE = 'assets/db/build_db.txt';
const INSERT_TABLE = 'assets/db/insert_db.txt';
const SELECT_TABLE = 'assets/db/SELECT_db.txt';

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
          doABunchOfDatabaseStuff();
        }
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

  void doABunchOfDatabaseStuff() async {
    // importing the database string
    String buildTable = await rootBundle.loadString(BUILD_TABLE);
    String insertTable = await rootBundle.loadString(INSERT_TABLE);
    // Development delete the file
    await deleteDatabase('journal.sqlite3.db');
    final Database database = await openDatabase('journal.sqlite3.db',
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(buildTable);
    });
    await database.transaction((txn) async {
      await txn.rawInsert(insertTable, [
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
}
