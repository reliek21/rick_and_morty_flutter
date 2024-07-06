abstract class CustomException implements Exception {
  final String message;

  CustomException({required this.message});
}

class ServerException extends CustomException {
  ServerException({required super.message});
}

class NetworkException extends CustomException {
  NetworkException({required super.message});
}