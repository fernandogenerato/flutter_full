import 'package:bytebank/model/contact.dart';

class Transaction {
  String id;
  double value;
  Contact contact;

  Transaction(this.id, this.value, this.contact) : assert(value > 0);

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    contact =
        json['contact'] != null ? new Contact.fromJson(json['contact']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    if (this.contact != null) {
      data['contact'] = this.contact.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transaction &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          contact == other.contact;

  @override
  int get hashCode => value.hashCode ^ contact.hashCode;
}
