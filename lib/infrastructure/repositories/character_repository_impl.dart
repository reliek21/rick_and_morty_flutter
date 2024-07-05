import 'package:flutter_feching/domain/entities/character_entity.dart';
import 'package:flutter_feching/domain/repositories/character_repository.dart';
import 'package:flutter_feching/infrastructure/datasources/character_data_source.dart';
import 'package:flutter_feching/infrastructure/models/character_model.dart';

class CharacterRepositoryImp implements CharacterRepository {
  final CharacterDataSource dataSource;

  CharacterRepositoryImp(this.dataSource);

  @override
  Future<List<CharacterEntity>> fetchCharacters() async {
    final List<CharacterModel> characters = await dataSource.fetchCharacters();
    
    List<CharacterEntity> characterEntities = characters.map(
      (characterModel) => CharacterEntity(
        name: characterModel.name,
        status: characterModel.status,
        species: characterModel.species,
        gender: characterModel.gender,
        image: characterModel.image
      )
    ).toList();

    return characterEntities;
  }
}