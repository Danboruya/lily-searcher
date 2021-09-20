import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:lily_searcher/api/i_http_client_api.dart';
import 'package:simple_logger/src/simple_logger.dart';

/// Http client api class
class HttpClientApi implements IHttpClientApi {
  factory HttpClientApi(SimpleLogger logger, {String baseUrl = ''}) {
    return _instance ??= HttpClientApi._internal(baseUrl, logger);
  }

  /// Internal constructor
  HttpClientApi._internal(this.baseUrl, this._logger);

  /// Instance of API (Singleton)
  static HttpClientApi? _instance;

  /// URL of API endpoint
  final String baseUrl;

  /// Logger
  final SimpleLogger _logger;

  /// Http request by POST method
  @override
  Future<String> postQuery(Uri uri, Map<String, String> queryBody) async {
    try {
      final http.Response res = await http.post(uri, body: queryBody);
      _logger.info("Http status code: ${res.statusCode}");
      return _parseRes(res.statusCode, res.bodyBytes);
    } on SocketException {
      throw Exception();
    }
  }

  String _parseRes(int status, Uint8List bodyBytes) {
    if (status == 200) {
      return utf8.decode(bodyBytes);
    } else {
      throw Exception('Http status: $status, Http Error has occurred.}');
    }
  }
}
