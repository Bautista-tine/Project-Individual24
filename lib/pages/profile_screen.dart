import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:finalproject24/pages/image_data.dart';
import 'favorite_screen.dart';
import 'tutorial_screen.dart';
import 'package:finalproject24/pages/tutorial_steps.dart' as tutorial_data;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> favorites = [];
  List<Map<String, String>> filteredData = [];

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    filteredData = imageData;
    _searchController.addListener(_filterSearchResults);
  }

  void _filterSearchResults() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        filteredData = imageData;
      } else {
        filteredData = imageData.where((item) {
          final title = item['title']!.toLowerCase();
          final desc = item['description']!.toLowerCase();
          return title.contains(query) || desc.contains(query);
        }).toList();
      }
    });
  }

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void toggleFavorite(Map<String, String> item) {
    setState(() {
      favorites.contains(item) ? favorites.remove(item) : favorites.add(item);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      buildMainScreen(context),
      FavoritesScreen(favorites: favorites, onToggleFavorite: toggleFavorite),
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pink[100],
        onTap: _onNavTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
    );
  }

  Widget buildMainScreen(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bloozoom',
          style: TextStyle(fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Colors.pink[100],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Fuzzy Wire Flowers',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search flower...',
                prefixIcon: const Icon(Icons.search, color: Colors.purple),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.purpleAccent, width: 1.5),
                ),
                filled: true,
                fillColor: Colors.purple[50],
                contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: List.generate((filteredData.length / 2).ceil(), (rowIndex) {
                final first = filteredData[rowIndex * 2];
                final second = (rowIndex * 2 + 1 < filteredData.length)
                    ? filteredData[rowIndex * 2 + 1]
                    : null;
                return Row(
                  children: [
                    Expanded(child: _buildBox(first, context)),
                    const SizedBox(width: 10),
                    Expanded(child: second != null ? _buildBox(second, context) : const SizedBox()),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddFlowerModal(context),
        backgroundColor: Colors.pink[200],
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBox(Map<String, String> item, BuildContext context) {
    final isFavorite = favorites.contains(item);
    final String title = item['title']!;
    final String imagePath = item['image']!;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TutorialScreen(
              title: title,
              imagePath: imagePath,
              description: item['description']!,
              materials: tutorial_data.getTutorialMaterials(title),
              steps: tutorial_data.getTutorialSteps(title),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        height: 210,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.purple[50],
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.purple, width: 2),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: imagePath.startsWith('lib/assets/')
                      ? Image.asset(
                    imagePath,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                      : Image.file(
                    File(imagePath),
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: GestureDetector(
                    onTap: () => toggleFavorite(item),
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'delete') {
                        _deleteFlower(item);
                      }
                    },
                    itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Delete'),
                      ),
                    ],
                    icon: const Icon(Icons.more_vert, color: Colors.purple),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.purple[900],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteFlower(Map<String, String> item) {
    setState(() {
      imageData.remove(item);
      filteredData.remove(item);
      favorites.remove(item);
      tutorial_data.tutorialSteps.remove(item['title']);
      tutorial_data.tutorialMaterials.remove(item['title']);
    });
  }

  Future<void> _showAddFlowerModal(BuildContext context) async {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final List<TextEditingController> materialControllers = [TextEditingController()];
    final List<TextEditingController> stepControllers = [TextEditingController()];
    String? pickedImagePath;

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: StatefulBuilder(
          builder: (context, setModalState) => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Add New Flower', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                TextField(controller: titleController, decoration: const InputDecoration(labelText: 'Flower Name')),
                TextField(controller: descriptionController, decoration: const InputDecoration(labelText: 'Description')),

                const SizedBox(height: 10),
                const Text('Materials:', style: TextStyle(fontWeight: FontWeight.bold)),
                ...materialControllers.asMap().entries.map((entry) {
                  int index = entry.key;
                  TextEditingController controller = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(labelText: 'Material ${index + 1}'),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            if (materialControllers.length > 1) {
                              setModalState(() => materialControllers.removeAt(index));
                            }
                          },
                        ),
                      ],
                    ),
                  );
                }),
                TextButton.icon(
                  onPressed: () {
                    setModalState(() => materialControllers.add(TextEditingController()));
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Material'),
                ),

                const SizedBox(height: 10),
                const Text('Steps:', style: TextStyle(fontWeight: FontWeight.bold)),
                ...stepControllers.asMap().entries.map((entry) {
                  int index = entry.key;
                  TextEditingController controller = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: controller,
                            decoration: InputDecoration(labelText: 'Step ${index + 1}'),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            if (stepControllers.length > 1) {
                              setModalState(() => stepControllers.removeAt(index));
                            }
                          },
                        ),
                      ],
                    ),
                  );
                }),
                TextButton.icon(
                  onPressed: () {
                    setModalState(() => stepControllers.add(TextEditingController()));
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Step'),
                ),

                const SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: const Icon(Icons.photo_library),
                  label: const Text('Pick Image from Gallery'),
                  onPressed: () async {
                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                    if (image != null) {
                      setModalState(() {
                        pickedImagePath = image.path;
                      });
                    }
                  },
                ),

                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (titleController.text.trim().isEmpty ||
                        descriptionController.text.trim().isEmpty ||
                        pickedImagePath == null) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please fill all fields and pick an image.')),
                      );
                      return;
                    }

                    final newItem = {
                      'title': titleController.text.trim(),
                      'image': pickedImagePath!,
                      'description': descriptionController.text.trim(),
                    };

                    final materials = materialControllers
                        .map((c) => c.text.trim())
                        .where((text) => text.isNotEmpty)
                        .toList();
                    final steps = stepControllers
                        .map((c) => c.text.trim())
                        .where((text) => text.isNotEmpty)
                        .toList();

                    setState(() {
                      imageData.add(newItem);
                      filteredData = imageData;
                      tutorial_data.tutorialMaterials[titleController.text.trim()] = materials;
                      tutorial_data.tutorialSteps[titleController.text.trim()] = steps;
                    });

                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[100]),
                  child: const Text('Add Flower'),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
