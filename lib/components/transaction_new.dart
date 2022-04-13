class Transaction_new {
  final double value;
  final String contact;

  const Transaction_new({
    required this.value,
    required this.contact,
  });

  @override
  String toString() {
    return 'Transaction: { value: $value , contact: $contact}';
  }
}
