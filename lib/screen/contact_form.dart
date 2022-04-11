import 'package:flutter/material.dart';
import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:bytebank/components/input.dart';
import 'package:bytebank/components/confirm_button.dart';
import 'package:bytebank/components/contact_new.dart';

class Contact_form extends StatefulWidget {
  final TextEditingController _controllerContato = TextEditingController();
  final TextEditingController _controllerAccount = TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  State<StatefulWidget> createState() => _Contact_form();
}

class _Contact_form extends State<Contact_form> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar contato'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Input(
            controller: widget._controllerContato,
            label: 'CONTATO',
            hint: 'ex: Danilo Camargo',
            keyboard: TextInputType.text,
          ),
          Input(
            controller: widget._controllerAccount,
            label: 'VALOR',
            hint: 'ex: 100.0',
            icon: true,
            keyboard: TextInputType.numberWithOptions(),
          ),
          Confirm_button(
            onPress: () {
              final String? contato = widget._controllerContato.text;
              final int? account = int.tryParse(widget._controllerAccount.text);

              if (contato != null && account != null) {
                final Contact_new requisicao =
                    Contact_new(name: contato, accountNumber: account);
                widget._dao.save(requisicao).then(
                      (id) => Navigator.pop(context),
                    );
              }
            },
          ),
        ]),
      ),
    );
  }
}
