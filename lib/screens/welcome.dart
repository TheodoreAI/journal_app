import 'package:flutter/material.dart';
import 'package:journal_app/screens/new_entry.dart';

class Welcome extends StatelessWidget {
  static const routeName = '/';
  final void Function(bool) updateTheme;
  final bool booleanLight;
  const Welcome(
      {Key? key, required this.updateTheme, required this.booleanLight})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Make sure the arguments sent from one screen to another match the type
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal App'),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      endDrawer: endDrawer(updateTheme),
      body: Center(
          child: Column(children: [
        Text('Welcome', style: Theme.of(context).textTheme.headline4),
        button(context),
      ])),
    );
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
          value: booleanLight,
          onChanged: updateTheme)
    ])
        // Disable opening the end drawer with a swipe gesture.
        // endDrawerEnableOpenDragGesture: false,
        );
  }
}
