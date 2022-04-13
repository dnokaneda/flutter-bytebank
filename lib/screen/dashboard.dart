import 'package:flutter/material.dart';
import 'package:bytebank/components/logo.dart';
import 'package:bytebank/screen/contact_list.dart';
import 'package:bytebank/screen/transaction_list.dart';

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Logo(),
          Row(
            children: [
              _featureItem(
                label: 'Transfer',
                icon: Icons.monetization_on,
                onClick: () {
                  _showContactsList(context);
                },
              ),
              _featureItem(
                label: 'Transactions',
                icon: Icons.description,
                onClick: () {
                  _showTransactionList(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _featureItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onClick;

  const _featureItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.0),
      child: Material(
        color: Colors.green,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            width: 140,
            height: 110,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    icon,
                    size: 24.0,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showContactsList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => Contact_list()),
  );
}

void _showTransactionList(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => Transaction_list()),
  );
}
