import 'package:flutter_feching/infrastructure/models/character_model.dart';

abstract class CharacterDataSource {
  Future<List<CharacterModel>> fetchCharacters();
}