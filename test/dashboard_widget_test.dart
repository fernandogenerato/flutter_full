import 'package:bytebank/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  testWidgets('should display the main image when the dashboard is opened',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });


  testWidgets('should display the transfer feature when the dashboard is opened', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Dashboard(),
    ));
    final iconTransferFeatureItem = find.widgetWithIcon(FeatureItem, Icons.monetization_on);
    expect(iconTransferFeatureItem, findsWidgets);
    final nameTransferFeatureItem = find.widgetWithText(FeatureItem, 'Transfer');
    expect(nameTransferFeatureItem, findsOneWidget);

    final iconTransactionFeatureItem = find.widgetWithIcon(FeatureItem, Icons.description);
    expect(iconTransactionFeatureItem, findsWidgets);
    final nameTransactionFeatureItem = find.widgetWithText(FeatureItem, 'Transaction Feed');
    expect(nameTransactionFeatureItem, findsOneWidget);


  });
/*
  testWidgets('first feature when the dashboard is opened', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Dashboard(),
    ));
    final iconTransferFeatureItem = find.byType(FeatureItem);
    expect(iconTransferFeatureItem, findsWidgets);
  });
*/



}
