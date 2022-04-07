import 'package:flutter/material.dart';

void main() => runApp(const ByteBank());

class ByteBank extends StatelessWidget {
  const ByteBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Formulario(),
      debugShowCheckedModeBanner: false,
    );
  }
}

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
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 24.0, 12.0, 12.0),
              child: TextField(
                controller: _controllerConta,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Número da conta',
                ),
              ),
            ),
            // INPUT VALOR
            Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 16.0),
              child: TextField(
                controller: _controllerValor,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  border: OutlineInputBorder(),
                  labelText: 'Valor',
                ),
              ),
            ),
            // BTN CONFIRMAR
            ElevatedButton(
              onPressed: () {
                // debugPrint(_controllerConta.text);
                // debugPrint(_controllerValor.text);
                final int? conta = int.tryParse(_controllerConta.text);
                final double? valor = double.tryParse(_controllerValor.text);
                if (conta != null && valor != null) {
                  final requisicao = Transferencia(conta: conta, valor: valor);
                  debugPrint('$requisicao');
                }
              },
              child: const Text('Confirmar'),
            ),
          ],
        ));
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
