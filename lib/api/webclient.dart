import 'dart:convert';
import 'package:bytebank/components/transaction_new.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:bytebank/api/interceptor.dart';

final String baseUrl = 'http://192.168.0.12:3333';

Future<List<Transaction_new>> findAll() async {
  Client client = InterceptedClient.build(interceptors: [
      LoggingInterceptor(),
  ]);

  final List<Transaction_new> transactions = [];
  final Response res = await client.get(Uri.parse('$baseUrl/transactions'))
                                   .timeout(Duration(seconds: 10));
  final List<dynamic> decodedJson = jsonDecode(res.body);
  
  for(Map<String, dynamic> element in decodedJson) {
    final Transaction_new transaction = Transaction_new(value: element['value'], contact: element['contact']['name']);
    transactions.add(transaction);
  }
  return transactions;
}