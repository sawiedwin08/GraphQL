import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/character_controller.dart';
import '../screens/character_detail_screen.dart';
import '../widgets/character_card.dart';

class HomeScreen extends StatelessWidget {
  final CharacterController characterController = Get.find<CharacterController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Star Wars Characters')),
      body: RefreshIndicator(
        onRefresh: () => characterController.fetchCharacters(),
        child: Obx(() {
          if (characterController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else if (characterController.error.value.isNotEmpty) {
            return Center(
              child: Text('Error: ${characterController.error.value}', style: TextStyle(color: Colors.red)),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: characterController.characters.length,
              itemBuilder: (context, index) {
                final character = characterController.characters[index];
                return CharacterCard(
                  character: character,
                  onTap: () => Get.to(() => CharacterDetailScreen(character: character)),
                );
              },
            );
          }
        }),
      ),
    );
  }
}
