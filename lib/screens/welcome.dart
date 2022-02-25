import 'package:flutter/material.dart';
import 'package:journal_app/screens/new_entry.dart';
import 'package:journal_app/screens/entry_view.dart';
import 'package:sqflite/sqflite.dart';
import '../models/journal_entry.dart';
import 'package:sqflite/sqflite.dart';

const selectTableQuery = 'assets/db/select_db.txt';
const buildTableQuery = 'assets/db/build_db.txt';

class Welcome extends StatefulWidget {
  static const routeName = '/';
  static const routeName1 = 'journalView';
  final void Function(bool) updateTheme;
  final bool booleanLight;

  const Welcome(
      {Key? key, required this.updateTheme, required this.booleanLight})
      : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  // late Journal? journal;
  late var journal = [];
  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    final Database database = await openDatabase('journal.sqlite3.db',
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(buildTableQuery);
    });
    List<Map> journalRecords =
        await database.rawQuery('SELECT * FROM journal_entries;');

    final journalEntries = journalRecords.map((record) {
      return JournalEntryFields(
          title: record['title'],
          body: record['body'],
          rating: record['rating'],
          dateTime: record['date']);
    }).toList();

    setState(() {
      journal = journalEntries;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Make sure the arguments sent from one screen to another match the type
    if (journal == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Welcome!')),
        body: Center(
            child: Icon(
          Icons.hourglass_empty,
          size: 60,
        )),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Journal App')),
          actions: [
            addEntry(context),
            Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
        ),
        endDrawer: endDrawer(widget.updateTheme),
        body: journal.isEmpty ? welcomeMsg(context) : journalListView(context),
      );
    }
  }

  Widget welcomeMsg(BuildContext context) {
    return Column(children: const [
      Center(
        child: Text('Welcome'),
      ),
      Center(
        child: Icon(Icons.hourglass_empty, size: 60),
      )
    ]);
  }

  Widget journalListView(BuildContext context) {
    // query the database and get the stuff from there

    return ListView.builder(
        itemCount: journal.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EntryView(
                      title: journal[index].title, body: journal[index].body),
                ),
              );
            },
            title: Text("${journal[index].title}"),
            subtitle: Text(
              '${journal[index].dateTime}',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          );
        });
  }

  Widget addEntry(BuildContext context) {
    return IconButton(
        onPressed: () async {
          displayWelcome(context);
          await deleteDatabase('journal.sqlite3.db');
        },
        icon: const Icon(Icons.add_circle_outline));
  }

  void displayWelcome(BuildContext context) {
    Navigator.of(context).pushNamed(NewEntry.routeName);
  }

  Widget endDrawer(updateTheme) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      const DrawerHeader(
          child: Text(
        'Change the Theme:',
        textAlign: TextAlign.center,
      )),
      SwitchListTile(
          title: const Text('Lights'),
          value: widget.booleanLight,
          onChanged: updateTheme)
    ]));
  }
}
