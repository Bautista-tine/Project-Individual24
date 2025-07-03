import 'package:flutter/material.dart';
import 'tutorial_screen.dart';
import 'package:finalproject24/pages/tutorial_steps.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favorites;
  final Function(Map<String, String>) onToggleFavorite;

  const FavoritesScreen({
    super.key,
    required this.favorites,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.pink[100],
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorites yet.'))
          : ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final item = favorites[index];
          final String title = item['title']!;

          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: Colors.purple[50],
              border: Border.all(color: Colors.purple, width: 2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  item['image']!,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                item['title']!,
                style: TextStyle(
                  color: Colors.purple[900],
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(item['description']!),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                onPressed: () => onToggleFavorite(item),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => TutorialScreen(
                      title: title,
                      imagePath: item['image']!,
                      description: item['description']!,
                      materials: getTutorialMaterials(title),
                      steps: getTutorialSteps(title),
                      stepImages: getTutorialStepImages(title),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
