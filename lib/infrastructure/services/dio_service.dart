import 'package:dio/dio.dart';

class HttpService {
  final Dio dio;

  HttpService({ required this.dio }) {
    dio.options.baseUrl = 'https://rickandmortyapi.com/api';
  }

  Future<Response<dynamic>> get(String url) async {
    try {
      final response = await dio.get(url);
      return response;
    } catch (e) {
      throw DioException(requestOptions: RequestOptions(path: url), error: e);
    }
  }
}
