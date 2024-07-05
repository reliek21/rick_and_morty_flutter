import 'package:flutter/material.dart';

class CharacterTile extends StatelessWidget {
  final String name;
  final String status;
  final String image;

  const CharacterTile({
    super.key,
    required this.name,
    required this.status,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(image),
      title: Text(name),
      subtitle: Text(status),
    );
  }
}