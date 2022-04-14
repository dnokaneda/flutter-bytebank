import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/components/loading.dart';
import 'package:bytebank/components/contact_card.dart';
import 'package:bytebank/components/contact_new.dart';
import 'package:bytebank/screen/contact_form.dart';

class Contact_list extends StatefulWidget {
  final ContactDao _dao = ContactDao();

  @override
  State<StatefulWidget> createState() => _Contact_list();
}

class _Contact_list extends State<Contact_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      body: FutureBuilder<List<Contact_new>>(
        initialData: [],
        future: widget._dao.findAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Loading();

            case ConnectionState.done:
              final List<Contact_new> contacts = snapshot.data;
              
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Contact_card(
                    contact: contacts[index],              
                  );
                },
              );

            default:
              return Text('Unknown Error');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return Contact_form();
            }),
          ).then(
            (value) => setState(() {}),
          );
        },
      ),
    );
  }
}
