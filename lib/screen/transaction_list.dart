import 'package:flutter/material.dart';

class Transaction_list extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Transaction_list();
}

class _Transaction_list extends State<Transaction_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: Text('Empty'),
    );
  }
}
