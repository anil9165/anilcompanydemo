import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:anilmastertest/redux/store.dart';
import 'package:anilmastertest/services/app_exceptions.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int TIME_OUT_DURATION = 20;
  Future<dynamic> get(String baseUrl, String api) async {
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/todos");
    print(store.state.token);
    try {
      var response = await http
          .get(uri)
          .timeout(const Duration(seconds: TIME_OUT_DURATION));
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "API not responded in time", uri.toString());
    }
  }

  Future<dynamic> post(String baseUrl, String api, dynamic payloadObj) async {
    var uri = Uri.parse(baseUrl +
        api); // https:reqres.in/api/login //eve.holt@eqres.in cityslicka
    var payload = json.encode(payloadObj);
    print("@@@@$payloadObj $payload");
    try {
      var response = await http.post(uri, body: payloadObj);
      // .timeout(const Duration(seconds: TIME_OUT_DURATION));
      print("@@@@$response");
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet connection", uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          "API not responded in time", uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    print("error ${utf8.decode(response.bodyBytes)}");
    switch (response.statusCode) {
      case 200:
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        print(utf8.decode(response.bodyBytes));
        throw FetchDataException(
            "Error occured with code : ${response.statusCode}",
            response.request!.url.toString());
    }
  }
}
