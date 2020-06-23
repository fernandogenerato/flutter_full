import 'package:bytebank/dao/contact_dao.dart';
import 'package:bytebank/model/contact.dart';
import 'package:flutter/material.dart';

class ContactsForm extends StatefulWidget {
  final ContactDao contactDao;

  ContactsForm({@required this.contactDao});

  @override
  _ContactsFormState createState() =>
      _ContactsFormState(contactDao: contactDao);
}

class _ContactsFormState extends State<ContactsForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();
  final ContactDao contactDao;

  _ContactsFormState({@required this.contactDao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Account Number',
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Create'),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int accountNumber =
                        int.tryParse(_accountNumberController.text);
                    final Contact newContact = Contact(0, name, accountNumber);
                    _save(newContact, context);
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _save(Contact newContact, BuildContext context) async {
    await contactDao.save(newContact);
    Navigator.pop(context);
  }
}
