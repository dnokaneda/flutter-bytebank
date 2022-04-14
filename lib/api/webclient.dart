import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:bytebank/api/interceptor.dart';

final String baseUrl = 'http://192.168.0.12:3333';
final Uri apiUrl = Uri.parse('$baseUrl/transactions');
final Duration timeout = Duration(seconds: 5);

final Client client = InterceptedClient.build(interceptors: [
  LoggingInterceptor(),
]);
