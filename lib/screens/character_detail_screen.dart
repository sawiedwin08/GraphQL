import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('id: ${character.id}'),
            Text('name: ${character.name}'),
            Text('height ${character.height}'),
            Text('mass: ${character.mass}'),
            Text('gender: ${character.gender}'),
            Text('homeworld: ${character.homeworld}'),
          ],
        ),
      ),
    );
  }
}