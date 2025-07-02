import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {

  final String title;
  final String imagePath;
  final String description;
  final List<String> steps;


  const TutorialScreen({
    super.key,
    required this.title,
    required this.imagePath,
    required this.description,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tutorial: $title'), backgroundColor: Colors.pink[100]),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(imagePath, height: 200, width: double.infinity, fit: BoxFit.cover),
              ),
              const SizedBox(height: 20),
              Text(description, style: const TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              const Text('Steps:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              for (int i = 0; i < steps.length; i++)
                Text('${i + 1}. ${steps[i]}', style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
