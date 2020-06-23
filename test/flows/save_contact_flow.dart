import 'package:bytebank/main.dart';
import 'package:bytebank/model/contact.dart';
import 'package:bytebank/screens/contact_form.dart';
import 'package:bytebank/screens/contacts_list.dart';
import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../matchers/matchers.dart';
import '../mocks/mocks.dart';

void main() {
  testWidgets('should save a contact', (tester) async {
    final mockContactDao = MockContactDao();

    await tester.pumpWidget(MyApp(
      contactDao: mockContactDao,
    ));

    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    final transferFeatureItem = find.byWidgetPredicate((widget) =>
        featureItemMatcher(widget, 'Transfer', Icons.monetization_on));
    expect(transferFeatureItem, findsOneWidget);

    await tester.tap(transferFeatureItem);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ContactsList);
    expect(contactsList, findsOneWidget);

    verify(mockContactDao.findAll()).called(1);

    final fabNewContact = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNewContact, findsOneWidget);
    await tester.tap(fabNewContact);
    await tester.pumpAndSettle();

    final contactForm = find.byType(ContactsForm);
    expect(contactForm, findsOneWidget);

    final nameTextField = find
        .byWidgetPredicate((widget) => textFieldMatcher(widget, 'Full Name'));
    expect(nameTextField, findsOneWidget);
    await tester.enterText(nameTextField, 'fernando');

    final accountTextField = find.byWidgetPredicate(
        (widget) => textFieldMatcher(widget, 'Account Number'));
    expect(accountTextField, findsOneWidget);
    await tester.enterText(accountTextField, 'Account Number');

    final createButton = find.widgetWithText(RaisedButton, 'Create');
    await tester.tap(createButton);
    await tester.pumpAndSettle();

    verify(mockContactDao.save(Contact(0, 'fernando', 1000)));

    final contactsListBack = find.byType(ContactsList);
    expect(contactsListBack, findsOneWidget);

    verify(mockContactDao.findAll());
  });
}
