// import 'package:flutter/material.dart';

// class ScaffoldDrawer extends StatefulWidget {
//   @override
//   _ScaffoldDrawerState createState() => _ScaffoldDrawerState();
// }

// class _ScaffoldDrawerState extends State<ScaffoldDrawer> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Journal App'),
//         ),
//         body: Center(
//             child: Column(children: [
//           Text('Welcome', style: Theme.of(context).textTheme.headline4),
//           button(context)
//         ])),
//         endDrawer: endDrawer);
//   }

//   Widget button(BuildContext context) {
//     return ElevatedButton(
//         child: const Text('Journal Form'),
//         onPressed: () {
//           displayWelcome(context);
//         });
//   }

//   void _openEndDrawer() {
//     _scaffoldKey.currentState!.openEndDrawer();
//   }

//   void _closeEndDrawer() {
//     Navigator.of(context).pop();
//   }

//   Widget endDrawer() {
//     return Drawer(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('This is the Drawer'),
//             ElevatedButton(
//               onPressed: () {},
//               child: const Text('Close Drawer'),
//             ),
//           ],
//         ),
//       ),
//       // Disable opening the end drawer with a swipe gesture.
//       endDrawerEnableOpenDragGesture: false,
//     );
//   }
// }

// }
