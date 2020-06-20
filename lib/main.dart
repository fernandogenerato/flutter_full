import 'package:bytebank/screens/dashboard.dart';
import 'package:bytebank/widgets/transaction_auth_dialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey[900],
        accentColor: Colors.lightGreenAccent[100],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.lightGreenAccent[100],
        ),
      ),
      home: Dashboard(),
    );
  }
}
