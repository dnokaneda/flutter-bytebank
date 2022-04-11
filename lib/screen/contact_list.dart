import 'package:flutter/material.dart';
import 'package:bytebank/components/contact_card.dart';
import 'package:bytebank/components/contact_new.dart';
import 'package:bytebank/screen/contact_form.dart';

class Contact_list extends StatefulWidget {
  final List<Contact_new> contacts = [];

  @override
  State<StatefulWidget> createState() => _Contacts();
}

class _Contacts extends State<Contact_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: ListView.builder(
        itemCount: widget.contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return Contact_card(contact: widget.contacts[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Contact_form();
          }));
          future.then((res) {
            // TESTE DELAY
            // Future.delayed(Duration(seconds: 1), () {
            //   if (res != null) { setState(() => widget.contacts.add(res)); }
            // });
            if (res != null) {
              setState(() => widget.contacts.add(res));
            }
          });
        },
      ),
    );
  }
}
