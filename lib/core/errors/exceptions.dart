abstract class Exception {
  final String message;

  Exception({required this.message});
}

class ServerException extends Exception {
  ServerException({required super.message});
}

class NetworkException extends Exception {
  NetworkException({required super.message});
}