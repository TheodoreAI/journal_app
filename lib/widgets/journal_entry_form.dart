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
  final journalEntryFieldsInstanceBucket = JournalEntryFields();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: 'Title', border: OutlineInputBorder()),
              onSaved: (value) {
                // store value in an object
                journalEntryFieldsInstanceBucket.title = value;
                // Save in a database here
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter a Title';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: 'Body', border: OutlineInputBorder()),
              onSaved: (value) {
                // store value in an object
                journalEntryFieldsInstanceBucket.title = value;
                // Save in a database here
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter a Body';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: 'Datetime', border: OutlineInputBorder()),
              onSaved: (value) {
                // store value in an object
                journalEntryFieldsInstanceBucket.title = value;
                // Save in a database here
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter a Datetime';
                } else {
                  return null;
                }
              },
            ),
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: 'Rating', border: OutlineInputBorder()),
              onSaved: (value) {
                // store value in an object
                journalEntryFieldsInstanceBucket.title = value;
                // Save in a database here
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter a Rating';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState?.save();
                  }
                },
                child: const Text('Save Entry'))
          ],
        ),
      ),
    );
  }
}
