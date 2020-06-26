import 'package:bytebank/dao/contact_dao.dart';
import 'package:bytebank/http/webclients/transaction_webclient.dart';
import 'package:bytebank/injectDependencies/app_dependecies.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(
    contactDao: ContactDao(),
    transactionWebClient: TransactionWebClient(),
  ));
}

class MyApp extends StatelessWidget {
  final ContactDao contactDao;
  final TransactionWebClient transactionWebClient;

  MyApp({
    @required this.contactDao,
    @required this.transactionWebClient,
  });

  @override
  Widget build(BuildContext context) {
    return AppDependencies(
      contactDao: contactDao,
      transactionWebClient: transactionWebClient,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.grey[900],
          accentColor: Colors.lightGreenAccent[100],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.lightGreenAccent[100],
          ),
        ),
        home: Dashboard(),
      ),
    );
  }
}
