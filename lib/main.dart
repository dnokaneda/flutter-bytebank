import 'package:flutter/material.dart';
import 'package:bytebank/screen/dashboard.dart';

void main() {
  runApp(ByteBank());
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
