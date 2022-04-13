import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:bytebank/api/interceptor.dart';

final String baseUrl = 'http://192.168.0.12:3333';

void findAll() async {
  Client client = InterceptedClient.build(interceptors: [
      LoggingInterceptor(),
  ]);

  await client.get(Uri.parse('$baseUrl/transactions'));
}