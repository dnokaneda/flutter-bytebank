import 'package:flutter/material.dart';
import 'package:bytebank/components/contact_new.dart';
import 'package:bytebank/screen/transaction_form.dart';

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
        onTap: () => { 
          print('onClick contact card'),
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Transaction_form(contact))
          ),
        },
        title: Text(contact.name.toString()),
        subtitle: Text(contact.accountNumber.toString()),
      ),
    );
  }
}
