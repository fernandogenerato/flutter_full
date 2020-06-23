import 'package:bytebank/dao/contact_dao.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(contactDao: ContactDao()));
}

class MyApp extends StatelessWidget {
  final ContactDao contactDao;

  MyApp({@required this.contactDao});

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
      home: Dashboard(contactDao: contactDao),
    );
  }
}
