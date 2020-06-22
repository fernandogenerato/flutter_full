import 'package:bytebank/model/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Create Transaction', () {
    final transaction = Transaction(null, 200, null);
    expect(transaction.value, 200);
  });

  test('Failed : transaction.value less zero ', () {
    expect(() => Transaction(null, 0, null), throwsAssertionError);
  });
}
