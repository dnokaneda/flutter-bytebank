import 'package:flutter/material.dart';
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/components/transferencia.dart';

class Formulario extends StatefulWidget {
  final TextEditingController _controllerConta = TextEditingController();
  final TextEditingController _controllerValor = TextEditingController();

  @override
  State<StatefulWidget> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          // INPUT CONTA
          Editor(
            controller: widget._controllerConta,
            label: 'Número da Conta',
            hint: 'ex: 123456',
          ),
          // INPUT VALOR
          Editor(
            controller: widget._controllerValor,
            label: 'VALOR',
            hint: 'ex: 100.0',
            icon: true,
          ),
          // BTN CONFIRMAR
          ElevatedButton(
            onPressed: () {
              final int? conta = int.tryParse(widget._controllerConta.text);
              final double? valor =
                  double.tryParse(widget._controllerValor.text);

              if (conta != null && valor != null) {
                final requisicao = Transferencia(conta: conta, valor: valor);
                Navigator.pop(context, requisicao);
              }
            },
            child: Text('Confirmar'),
          ),
        ]),
      ),
    );
  }
}
