import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_feching/domain/entities/character_entity.dart';
import 'package:flutter_feching/presentation/providers/character_provider.dart';
import 'package:flutter_feching/presentation/widgets/CharacterTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CharacterProvider _provider;

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<CharacterProvider>(context, listen: false);
    _provider.fetchAllCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CharacterProvider>(
        builder: (BuildContext context, CharacterProvider provider, Widget? child) {
          if (provider.characters.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: provider.characters.length,
            itemBuilder: (BuildContext context, int index) {
              final CharacterEntity character = provider.characters[index];

              final characterName = character.name;
              final characterStatus = character.status;
              final characterImage = character.image;

              return CharacterTile(
                name: characterName,
                status: characterStatus,
                image: characterImage,
              );
            },
          );
        },
      )
    );
  }
}
