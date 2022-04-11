class Contact_new {
  final String? contato;
  final double? valor;

  const Contact_new({
    this.contato,
    this.valor,
  });

  @override
  String toString() {
    return 'Contact: { conta: $contato , valor: $valor}';
  }
}
