class Transaction_new {
  final double value;
  final String contact;
  final int accountNumber;

  const Transaction_new({
    required this.value,
    required this.contact,
    required this.accountNumber,
  });

  Transaction_new.fromJson(Map<String, dynamic> json) 
    : value = json['value'],
      contact = json['contact']['name'],
      accountNumber = json['contact']['accountNumber'];

  Map<String, dynamic> toJson() => {
    'value': value,
    'contact': {
      'name': contact,
      'accountNumber': accountNumber,
    }
  };

  @override
  String toString() {
    return 'Transaction: { value: $value , contact: $contact, accountNumber: $accountNumber}';
  }
}
