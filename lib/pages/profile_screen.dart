import 'package:flutter/material.dart';
import 'package:finalproject24/pages/image_data.dart';
import 'favorite_screen.dart';
import 'tutorial_screen.dart';
import 'package:finalproject24/pages/tutorial_steps.dart';

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
                hintText: 'Search features...',
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
    );
  }

  Widget _buildBox(Map<String, String> item, BuildContext context) {
    final isFavorite = favorites.contains(item);
    final String title = item['title']!;

    return GestureDetector(
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
                  child: Image.asset(
                    item['image']!,
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
              ],
            ),
            const SizedBox(height: 10),
            Text(
              item['title']!,
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
}
