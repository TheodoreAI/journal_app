import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  static const routeName = 'newentry';

  const Welcome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Make sure the arguments sent from one screen to another match the type
    final String recievedValue =
        ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
        appBar: AppBar(
          title: Text(recievedValue),
        ),
        body: Center(
            child: Text(
                'the Back Button in the App Bar\n'
                'We get this for free!\n'
                'Managed by the Navigator.\n',
                style: Theme.of(context).textTheme.headline4)));
  }
}
