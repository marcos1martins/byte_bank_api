import 'package:bytebank/screens/contacts_list.dart';
import 'package:flutter/material.dart';

import 'contacts_list.dart';
import 'transactions_list.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/bytebank_logo.png'),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _FeatureItem(
                      icon: Icons.monetization_on,
                      titulo: "Transfer",
                      onClick: () => _showContactList(context),
                    ),
                    _FeatureItem(
                      icon: Icons.description,
                      titulo: "Trasaction feed",
                      onClick: () => _showTransactionList(context),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  void _showContactList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ContactsList()),
    );
  }

  _showTransactionList(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => TransactionsList()),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final Function onClick;
  final IconData icon;
  final String titulo;

  const _FeatureItem(
      {@required this.icon, @required this.titulo, @required this.onClick})
      : assert(titulo != null),
        assert(icon != null);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            onClick();
          },
          child: Container(
            padding: EdgeInsets.all(8),
            height: 100,
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24,
                ),
                Text(
                  titulo,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
