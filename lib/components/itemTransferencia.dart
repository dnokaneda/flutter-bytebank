import 'package:flutter/material.dart';
import 'package:bytebank/components/transferencia.dart';

class ItemTransferencia extends StatelessWidget {
  final Transferencia transferencia;

  const ItemTransferencia({
    Key? key,
    required this.transferencia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(transferencia.valor.toString()),
        subtitle: Text(transferencia.conta.toString()),
        trailing: const Icon(Icons.more_vert),
      ),
    );
  }
}
