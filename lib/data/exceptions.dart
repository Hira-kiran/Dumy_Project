class AppExceptions implements Exception {
  final _message;

  AppExceptions([
    this._message,
  ]);

  @override
  String toString() {
    return "$_message ";
  }
}

class BadRequestException extends AppExceptions {
  BadRequestException([String? message]) : super("BadRequestException");
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message]) : super("No Internet Exception");
}

class ServerException extends AppExceptions {
  ServerException([String? message]) : super("Server Exception");
}

class FatchDataException extends AppExceptions {
  FatchDataException([String? message]) : super("Fatch Data Exception");
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message]) : super("un Authorized Exception");
}
