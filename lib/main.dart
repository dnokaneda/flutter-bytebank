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

// REFACTORE 02
class ListaTransferencia extends StatelessWidget {
  const ListaTransferencia({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        ItemTransferencia(
            transferencia: Transferencia(valor: 150.0, conta: 'Itaú')),
        ItemTransferencia(
            transferencia: Transferencia(valor: 260.0, conta: 'nuBank')),
        ItemTransferencia(
            transferencia: Transferencia(valor: 370.0, conta: 'Inter')),
      ],
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  const ItemTransferencia({
    Key? key,
    required this.transferencia,
  }) : super(key: key);

  final Transferencia transferencia;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.conta),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final String conta;

  const Transferencia({
    required this.valor,
    required this.conta,
  });
}
