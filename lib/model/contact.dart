class Contact{

  final String name;
  final int accountNumer;

  Contact(this.name, this.accountNumer);

  @override
  String toString() {
    return 'Contact{name: $name, accountNumer: $accountNumer}';
  }
}