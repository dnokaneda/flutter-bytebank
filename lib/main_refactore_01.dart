import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Transferências'),
        ),
        body: const ListaTransferencia(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => '',
        ),
      ),
      debugShowCheckedModeBanner: false,
    ));

// StatefulWidget => permite alterações dinâmicas
// StatelessWidget => widget estático

class ListaTransferencia extends StatelessWidget {
  const ListaTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ItemTransferencia(valor: '100', conta: 'Itaú'),
        ItemTransferencia(valor: '250', conta: 'nuBank'),
        ItemTransferencia(valor: '2750', conta: 'Inter'),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  const ItemTransferencia({
    Key? key,
    required this.valor,
    required this.conta,
  }) : super(key: key);

  final String valor;
  final String conta;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(valor),
        subtitle: Text(conta),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
