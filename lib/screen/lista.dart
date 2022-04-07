import 'package:flutter/material.dart';
import 'package:bytebank/components/itemTransferencia.dart';
import 'package:bytebank/components/transferencia.dart';
import 'package:bytebank/screen/formulario.dart';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> transferencias = [];

  @override
  State<StatefulWidget> createState() => _ListaTransferencia();
}

class _ListaTransferencia extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Transferências'),
      ),
      body: ListView.builder(
        itemCount: widget.transferencias.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemTransferencia(transferencia: widget.transferencias[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Formulario();
          }));
          future.then((res) {
            // TESTE DELAY
            // Future.delayed(Duration(seconds: 1), () {
            //   if (res != null) { setState(() => widget.transferencias.add(res)); }
            // });
            if (res != null) {
              setState(() => widget.transferencias.add(res));
            }
          });
        },
      ),
    );
  }
}
