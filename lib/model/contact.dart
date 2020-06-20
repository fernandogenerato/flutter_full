class Contact {
  int id;
  String name;
  int accountNumber;

  Contact(this.id, this.name, this.accountNumber);

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    accountNumber = json['accountNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['accountNumber'] = this.accountNumber;
    return data;
  }

  @override
  String toString() {
    return '\nContact{id: $id, name: $name, accountNumer: $accountNumber}';
  }
}
