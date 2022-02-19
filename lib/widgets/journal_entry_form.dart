import 'package:flutter/material.dart';

class JournalEntryFields {
  // Date Transfer Object (DTO)
  String? title;
  String? body;
  DateTime? dateTime;
  int? rating;
  String toStrings() {
    return 'Title: $title, Body: $body, Time: $dateTime, Rating: $rating';
  }
}

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
      onPressed: () {
        if (formKey.currentState!.validate()) {
          formKey.currentState?.save();
          print('SAVED TO DATABASE');
          addDateToJournalEntryValue();
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
}
