import 'dart:convert';

import 'package:bytebank/http/webclient.dart';
import 'package:bytebank/model/transaction.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transaction>> findAll() async {
    final Response response = await client.get(base_url);
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson
        .map((dynamic json) => Transaction.fromJson(json))
        .toList();
  }

  Future<Transaction> save(Transaction transaction, String password) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    await Future.delayed(Duration(seconds: 2));

    final Response response = await client.post(base_url,
        headers: {
          'Content-Type': 'application/json',
          'password': password,
        },
        body: transactionJson);
    if (response.statusCode == 200) {
      return Transaction.fromJson(jsonDecode(response.body));
    }
    throw HttpException(_getMessage(response.statusCode));
  }

  String _getMessage(int statusCode) {
    if (_statusCodeResponse.containsKey(statusCode)) {
      return _statusCodeResponse[statusCode];
    }
    return 'Unknown error';
  }

  static final Map<int, String> _statusCodeResponse = {
    400: 'there was an error submitting transaction',
    401: 'authentication failed',
    409: 'transaction always exist'
  };
}

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}
