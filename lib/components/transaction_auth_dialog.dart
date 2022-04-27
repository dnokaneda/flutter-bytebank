import 'package:flutter/material.dart';

class Transaction_Auth_Dialog extends StatefulWidget {
  final Function(String password) onConfirm;

  const Transaction_Auth_Dialog({
    Key? key,
    required this.onConfirm,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Transaction_Auth_Dialog();
}

class _Transaction_Auth_Dialog extends State<Transaction_Auth_Dialog> {
  
  final TextEditingController _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: const Text('Authenticate'),
        content: TextField(
          controller: _passwordController,
          obscureText: true,
          autofocus: true,
          maxLength: 4,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
          style: TextStyle(fontSize: 64, letterSpacing: 16),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text('Confirm'),
            onPressed: () {
              widget.onConfirm(_passwordController.text);
              Navigator.pop(context);
            },
          ),
        ],
      );
  }
}