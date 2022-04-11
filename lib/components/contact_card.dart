import 'package:flutter/material.dart';
import 'package:bytebank/components/contact_new.dart';

class Contact_card extends StatelessWidget {
  final Contact_new contact;

  const Contact_card({
    Key? key,
    required this.contact,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(contact.contato.toString()),
        subtitle: Text(contact.valor.toString()),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
