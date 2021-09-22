import 'dart:convert';

class AppException implements Exception {
  final message;
  final String? prefix;
  final String? url;
  AppException([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppException {
  BadRequestException([Object? message, String? url])
      : super(message, "Bad Request", url);
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url])
      : super(message, "Unable to process", url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, "Apin not responding ", url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? url])
      : super(message, "UnAuthorized Request", url);
}
