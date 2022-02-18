// import 'package:flutter/material.dart';

// void main() => runApp(App());

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home:
//             Scaffold(appBar: AppBar(title: Text('Sign In')), body: NameForm()));
//   }
// }

// class NameForm extends StatefulWidget {
//   @override
//   NameFormState createState() => NameFormState();
// }

// class NameFormState extends State<NameForm> {
//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: formKey,
//         child: Padding(
//             padding: const EdgeInsets.all(20),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: formFields(context))));
//   }

//   List<Widget> formFields(BuildContext context) {
//     return [
//       TextFormField(
//         autofocus: true,
//         decoration: InputDecoration(
//             labelText: 'Username', border: OutlineInputBorder()),
//         validator: (value) => validateUsername(value),
//       ),
//       SizedBox(height: 20),
//       TextFormField(
//         autofocus: true,
//         decoration: InputDecoration(
//             labelText: 'Password', border: OutlineInputBorder()),
//         // TODO: Specify the validator closure
//       ),
//       SizedBox(height: 10),
//       RaisedButton(
//           // TODO: invoke validateAndSignIn when pressed
//           onPressed: () {},
//           child: Text('Sign In'))
//     ];
//   }

//   void validateAndSignIn(BuildContext context) {
//     final formState = formKey.currentState;
//     if (formState.validate()) {
//       Scaffold.of(context)
//           .showSnackBar(SnackBar(content: Text('Logging you in...')));
//     }
//   }

//   String validateUsername(String username) {
//     // TODO: Implement validation logic.
//     //       Return a String (error message) or null
//   }

//   String validatePassword(String password) {
//     // TODO: Implement validation logic.
//     //       Return a String (error message) or null
//   }
// }
