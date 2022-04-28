import 'package:bytebank/api/transaction_webcliente.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/components/contact_new.dart';
import 'package:bytebank/components/response_dialog.dart';
import 'package:bytebank/components/transaction_new.dart';
import 'package:bytebank/components/transaction_auth_dialog.dart';

class Transaction_form extends StatefulWidget {
  final Contact_new contact;

  Transaction_form(this.contact);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<Transaction_form> {
  final TextEditingController _valueController = TextEditingController();
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New transaction'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.contact.name,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contact.accountNumber.toString(),
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(labelText: 'Value'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    child: Text('Transfer'), onPressed: () { 
                      handleTransaction(
                        _valueController, 
                        context,
                        widget.contact, 
                        _webClient,
                      ); // handleTransaction
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> handleTransaction(
  TextEditingController _valueController,
  BuildContext context,
  Contact_new contact,
  TransactionWebClient _webClient
) async {
  if(_valueController.text.isEmpty) {
    showDialog(
      context: context, 
      builder: (contextDialog) {
        return ResponseDialog(message: 'empty field');
      },
    );                        
  } else {
    showDialog(
      context: context, 
      builder: (contextDialog) {
        return Transaction_Auth_Dialog(
          onConfirm: (String password) {
            final Transaction_new transactionCreated = Transaction_new(
              value: double.parse(_valueController.text),
              contact:  contact.name,
              accountNumber:  contact.accountNumber,
            );
                                          
            saveNew(transactionCreated, password, context, _webClient);
          },
        );
      },
    ); // showDialog
  }
}

Future<void> saveNew(
  Transaction_new transactionCreated,
  String password,
  BuildContext context,
  TransactionWebClient _webClient
) async {
  try {
    await _webClient.save(transactionCreated, password);
    Navigator.pop(context);
    showDialog(
      context: context, 
      builder: (contextDialog) {
        return SuccessDialog(message: 'successfull transaction');
     },
    );
  } catch (error) {
    final String message = error.toString().replaceAll('Exception: ', '');
    showDialog(
      context: context, 
      builder: (contextDialog) {
        return ResponseDialog(message: message);
     },
    );
  }
}
