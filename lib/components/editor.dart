import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool? icon;

  const Editor({
    Key? key,
    required this.controller,
    required this.label,
    required this.hint,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          icon: icon != null ? const Icon(Icons.monetization_on) : null,
          border: const OutlineInputBorder(),
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}
