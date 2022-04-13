import 'package:flutter/material.dart';
import 'package:bytebank/components/transaction_new.dart';

class Transaction_card extends StatelessWidget {
  final Transaction_new contact;

  const Transaction_card({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(contact.value.toString()),
        subtitle: Text(contact.contact.toString()),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
