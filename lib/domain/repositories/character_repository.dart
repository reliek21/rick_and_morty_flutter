import 'package:flutter_feching/domain/entities/character_entity.dart';

abstract class CharacterRepository {
  Future<List<CharacterEntity>> fetchCharacters();
}