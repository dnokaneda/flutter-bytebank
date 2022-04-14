import 'package:bytebank/components/transaction_card.dart';
import 'package:bytebank/components/transaction_new.dart';
import 'package:bytebank/components/loading.dart';
import 'package:bytebank/components/centered_message.dart';
import 'package:bytebank/api/transaction_webcliente.dart';
import 'package:flutter/material.dart';

class Transaction_list extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Transaction_list();
}

class _Transaction_list extends State<Transaction_list> {
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfers'),
      ),
      body: FutureBuilder<List<Transaction_new>>(
        initialData: [],
        future: _webClient.findAll(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Loading();

            case ConnectionState.done:
              print('TRANSACTION LIST :::');
              print(snapshot);
              if (snapshot.hasData) {
                final List<Transaction_new> transactions = snapshot.data;
                return ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Transaction_card(contact: transactions[index]);
                  },
                );
              }   
              return CenteredMessage('No transactions found', icon: Icons.warning,);          
            default:
              return CenteredMessage('Unknown Error');
          }
        },
      ),
    );
  }
}
