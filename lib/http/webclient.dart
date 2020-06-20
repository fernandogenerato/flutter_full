import 'dart:convert';

import 'package:bytebank/model/contact.dart';
import 'package:bytebank/model/transaction.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http_interceptor/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';

const String _base_url = 'http://192.168.0.67:8080/transactions';
final Client client =
    HttpClientWithInterceptor.build(interceptors: [LoggingInterceptor()]);

Future<List<Transaction>> findAll() async {
  final Response response = await client.get(_base_url).timeout(Duration(
        seconds: 5,
      ));

  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<Transaction> transactions = List();

  for (Map<String, dynamic> transactionJson in decodedJson) {
    final Map<String, dynamic> contactJson = transactionJson['contact'];

    transactions.add(
      Transaction(
        transactionJson['value'],
        Contact(
          0,
          contactJson['name'],
          contactJson['accountNumber'],
        ),
      ),
    );
  }
  return transactions;
}

Future<Transaction> save(Transaction transaction) async {
  final Map<String, dynamic> transactionMap = {
    'value': transaction.value,
    'contact': {
      'name': transaction.contact.name,
      'accountNumber':  transaction.contact.accountNumber
    }
  };

  final String transactionJson = jsonEncode(transactionMap);
  final Response response = await client.post(_base_url,
      headers: {
        'Content-Type': 'application/json',
        'password': '1000',
      },
      body: transactionJson);

  Map<String, dynamic> json = jsonDecode(response.body);

  final Map<String, dynamic> contactJson = json['contact'];
  return Transaction(
    json['value'],
    Contact(
      0,
      contactJson['name'],
      contactJson['accountNumber'],
    ),
  );
}

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    print('Request');
    print('url : ${data.baseUrl}');
    print('${data.method}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print('>>>>>>>>>>>>>>>>>>>>>>>>> Response <<<<<<<<<<<<<<<<<<<<<<<');
    print('>>>>>>>>>>>>>>>>> statusCode : ${data.statusCode}');
    print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<<<<<<<<<<<<<<<<<<<<<<<<<');

    return data;
  }
}
