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
