class Transaction_new {
  final double value;
  final String contact;
  final int accountNumber;

  const Transaction_new({
    required this.value,
    required this.contact,
    required this.accountNumber,
  });

  @override
  String toString() {
    return 'Transaction: { value: $value , contact: $contact, accountNumber: $accountNumber}';
  }
}
