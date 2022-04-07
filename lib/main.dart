import 'package:flutter/material.dart';

void main() {
  runApp(const ByteBank());
}

class ByteBank extends StatelessWidget {
  const ByteBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListaTransferencia(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// FORMULÁRIO
// ////////////////////////

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final TextEditingController _controllerConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Criando Transferência'),
        ),
        body: Column(
          children: <Widget>[
            // INPUT CONTA
            Editor(
              controller: _controllerConta,
              label: 'Número da Conta',
              hint: 'ex: 123456',
            ),
            // INPUT VALOR
            Editor(
              controller: _controllerValor,
              label: 'VALOR',
              hint: 'ex: 100.0',
              icon: true,
            ),
            // BTN CONFIRMAR
            ElevatedButton(
              onPressed: () {
                final int? conta = int.tryParse(_controllerConta.text);
                final double? valor = double.tryParse(_controllerValor.text);

                if (conta != null && valor != null) {
                  final requisicao = Transferencia(conta: conta, valor: valor);
                  // debugPrint('requisicao :::');
                  // debugPrint('$requisicao');
                  Navigator.pop(context, requisicao);
                }
              },
              child: const Text('Confirmar'),
            ),
          ],
        ));
  }
}

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

// LISTA TRANSFERENCIA
// ////////////////////////

class ListaTransferencia extends StatefulWidget {
  const ListaTransferencia({Key? key}) : super(key: key);

  @override
  State<ListaTransferencia> createState() => _ListaTransferencia();
}

class _ListaTransferencia extends State<ListaTransferencia> {
  late List<Transferencia> transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: ListView.builder(
        itemCount: transferencias.length,
        itemBuilder: (BuildContext context, int index) {
          return ItemTransferencia(transferencia: transferencias[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final Future future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const Formulario();
          }));
          future.then((res) {
            setState(() => transferencias.add(res));
          });
        },
      ),
    );
  }
}

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

class Transferencia {
  final int? conta;
  final double? valor;

  const Transferencia({
    this.conta,
    this.valor,
  });

  @override
  String toString() {
    return 'Transferencia: { conta: $conta , valor: $valor}';
  }
}
