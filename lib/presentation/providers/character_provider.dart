import 'package:flutter/material.dart';
import 'package:flutter_feching/domain/entities/character_entity.dart';
import 'package:flutter_feching/domain/repositories/character_repository.dart';

class CharacterProvider with ChangeNotifier {
  final CharacterRepository repository;

  CharacterProvider(this.repository);

  late List<CharacterEntity> _characters = [];
  List<CharacterEntity> get characters => _characters;

  late CharacterEntity? _character;
  CharacterEntity? get character => _character;

  Future<void> fetchAllCharacters() async {
    _characters = await repository.fetchCharacters();
    notifyListeners();
  }
}