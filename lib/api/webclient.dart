import 'dart:convert';
import 'package:bytebank/components/transaction_new.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:bytebank/api/interceptor.dart';

final String baseUrl = 'http://192.168.0.12:3333';
final Uri apiUrl = Uri.parse('$baseUrl/transactions');
final Duration timeout = Duration(seconds: 5);

final Client client = InterceptedClient.build(interceptors: [
  LoggingInterceptor(),
]);

Future<List<Transaction_new>> findAll() async {
  final List<Transaction_new> transactions = [];
  
  final Response res = await client.get(apiUrl).timeout(timeout);
  
  final List<dynamic> decodedJson = jsonDecode(res.body);
  
  for(Map<String, dynamic> element in decodedJson) {
    final Transaction_new transaction = Transaction_new(
      value: element['value'], 
      contact: element['contact']['name'],
      accountNumber: element['contact']['accountNumber'],
    );

    transactions.add(transaction);
  }

  return transactions;
}

Future<Transaction_new> save(Transaction_new transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact,
      'accountNumber': transaction.accountNumber,
    },
  };

  final String transactionJson = jsonEncode(transactionMap);
  
  final Response res = await client.post(
    apiUrl,     
    headers: {
      'Content-type': 'application/json',
      'password': '2000',
    },
    body: transactionJson,
  ).timeout(timeout);

  Map<String, dynamic> resJson = jsonDecode(res.body);

  return Transaction_new(
    value: resJson['value'], 
    contact: resJson['contact']['name'],
    accountNumber: resJson['contact']['accountNumber'],
  );
}