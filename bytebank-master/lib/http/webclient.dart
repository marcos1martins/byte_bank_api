import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print("Request");
    print('Url: ${data.baseUrl}');
    print('Headers: ${data.headers}');
    print('Body: ${data.body}');

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print("Response");
    print("Status code: ${data.statusCode}");
    print('Headers: ${data.headers}');
    print('Body: ${data.body}');
    return data;
  }
}

void findAll() async {
  Client client = HttpClientWithInterceptor.build(interceptors: [
    LoggingInterceptor(),
  ]);
  final Response response =
      await client.get("http://192.168.1.15:8080/transactions");
}
