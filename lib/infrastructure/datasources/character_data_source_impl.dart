import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_feching/infrastructure/models/character_model.dart';
import 'package:flutter_feching/infrastructure/datasources/character_data_source.dart';

class CharacterDataSourceImpl implements CharacterDataSource {

  @override
  Future<List<CharacterModel>> fetchCharacters() async {
    final http.Response response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));

    try {
      if (response.statusCode == 200) {
        final List<dynamic> jsonList = jsonDecode(response.body)['results'];
        final List<CharacterModel> characters = jsonList.map((dynamic json) => CharacterModel.fromJson(json)).toList();
        return characters;
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (error) {
      throw Exception('Failed to load characters: $error');
    }
  }
}
