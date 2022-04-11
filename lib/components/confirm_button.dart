import 'package:flutter/material.dart';

class Confirm_button extends StatelessWidget {
  final void Function() onPress;

  const Confirm_button({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.maxFinite,
        child: ElevatedButton(
          onPressed: onPress,
          child: Text('Confirmar'),
        ),
      ),
    );
  }
}
