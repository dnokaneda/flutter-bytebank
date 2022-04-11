class Contact_new {
  final int? id;
  final String name;
  final int accountNumber;

  const Contact_new({
    this.id,
    required this.name,
    required this.accountNumber,
  });

  @override
  String toString() {
    return 'Contact: { conta: $name , valor: $accountNumber}';
  }
}
