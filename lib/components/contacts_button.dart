import 'package:flutter/material.dart';

class Contacts_button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Container(
        width: 150,
        height: 150,
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(
                Icons.people,
                size: 42.0,
                color: Colors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Contacts',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
