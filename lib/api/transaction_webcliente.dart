import 'dart:convert';
import 'package:bytebank/components/transaction_new.dart';
import 'package:http/http.dart';
import 'package:bytebank/api/webclient.dart';

class TransactionWebClient {

  Future<List<Transaction_new>> findAll() async {
    final Response res = await client.get(apiUrl).timeout(timeout);
    final List<Transaction_new> transactions = _toTransactions(res);
    return transactions;
  }

  Future<Transaction_new> save(Transaction_new transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());
    
    final Response res = await client.post(
      apiUrl,     
      headers: {
        'Content-type': 'application/json',
        'password': '2000',
      },
      body: transactionJson,
    ).timeout(timeout);

    return Transaction_new.fromJson(jsonDecode(res.body));
  }

  List<Transaction_new> _toTransactions(Response res) {
    final List<dynamic> decodedJson = jsonDecode(res.body);
    
    return decodedJson.map((dynamic json) {
      return Transaction_new.fromJson(json);
    }).toList();
    
    // final List<Transaction_new> transactions = [];

    // for(Map<String, dynamic> element in decodedJson) {
    //   transactions.add(Transaction_new.fromJson(element));
    // }

    // return transactions;
  }
}