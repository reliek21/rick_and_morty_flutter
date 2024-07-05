import 'package:dio/dio.dart';

import 'package:flutter_feching/core/errors/failure.dart';
import 'package:flutter_feching/core/errors/exceptions.dart';

import 'package:flutter_feching/infrastructure/services/dio_service.dart';
import 'package:flutter_feching/infrastructure/models/character_model.dart';
import 'package:flutter_feching/infrastructure/datasources/character_data_source.dart';

class CharacterDataSourceImpl implements CharacterDataSource {
  final HttpService httpService;

  CharacterDataSourceImpl(this.httpService);

  @override
  Future<List<CharacterModel>> fetchCharacters() async {
    try {
      final Response<dynamic> response = await httpService.get('/character');

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.data['results'];
        final List<CharacterModel> characters = jsonList
          .map((dynamic json) => CharacterModel.fromJson(json))
          .toList();
        return characters;
      } else {
        throw NetworkFailure(message: 'Failed to load characters');
      }
    } catch (error) {
      if (error is DioException) {
        throw NetworkException(message: 'Failed to load characters: ${error.message}');
      } else {
        throw NetworkException(message: 'Failed to load characters: $error');
      }
    }
  }
}
