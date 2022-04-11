import 'package:bytebank/components/contact_new.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/screen/dashboard.dart';

void main() {
  runApp(ByteBank());
  save(Contact_new(name: 'Danilo', accountNumber: 12346)).then((id) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
}

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteBank',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.orangeAccent,
            onPrimary: Colors.black87,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          accentColor: Colors.orangeAccent,
        ),
      ),
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
