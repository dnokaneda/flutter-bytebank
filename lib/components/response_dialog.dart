import 'package:flutter/material.dart';

class ResponseDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonText;
  final Color colorIcon;

  ResponseDialog({
    this.title = "",
    this.message = "",
    this.buttonText = 'Ok',
    this.colorIcon = Colors.redAccent,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Visibility(
        child: Text(title),
        visible: title.isNotEmpty,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Visibility(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Icon(
                Icons.warning,
                size: 64,
                color: colorIcon,
              ),
            ),
            visible: true,
          ),
          Visibility(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            visible: message.isNotEmpty,
          )
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: Text(buttonText),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}

class SuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  SuccessDialog({
    required this.message, 
    this.title = 'Success',
    this.icon = Icons.done,
  });

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      colorIcon: Colors.green,
    );
  }
}

class FailureDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;

  FailureDialog(
    this.message, {
    this.title = 'Failure',
    this.icon = Icons.warning,
  });

  @override
  Widget build(BuildContext context) {
    return ResponseDialog(
      title: title,
      message: message,
      colorIcon: Colors.red,
    );
  }
}
