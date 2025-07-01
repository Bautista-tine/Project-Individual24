import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ProfileScreen(),
    debugShowCheckedModeBanner: false,
  ));
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> favorites = [];

  final List<Map<String, String>> imageData = [
    {
      'title': 'Lavender',
      'image': 'lib/assets/f1.jpg',
      'description': 'Lavender is a soothing purple flower with fuzzy petals.',
    },
    {
      'title': 'Feature 2',
      'image': 'lib/assets/f2.jpg',
      'description': 'Feature 2 is an elegant creation perfect for gifting.',
    },
    {
      'title': 'Feature 3',
      'image': 'lib/assets/f3.jpg',
      'description': 'This is a charming flower with vibrant petals.',
    },
    {
      'title': 'Tulip',
      'image': 'lib/assets/f4.jpg',
      'description': 'Tulip is a classic bloom with smooth curves.',
    },
    {
      'title': 'Strawberry',
      'image': 'lib/assets/strawberry.jpg',
      'description': 'A cute strawberry-themed design with fresh vibes.',
    },
    {
      'title': 'Ribbon',
      'image': 'lib/assets/keychain2.jpg',
      'description': 'A ribbon-style accessory that’s simple yet pretty.',
    },
    {
      'title': 'Cherry',
      'image': 'lib/assets/cherry.jpg',
      'description': 'A cherry-inspired fuzzy piece that’s super sweet.',
    },
    {
      'title': 'Keychain',
      'image': 'lib/assets/key.jpg',
      'description': 'Minimalist keychain with delicate floral touches.',
    },
  ];

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void toggleFavorite(Map<String, String> item) {
    setState(() {
      if (favorites.contains(item)) {
        favorites.remove(item);
      } else {
        favorites.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      buildMainScreen(context),
      FavoritesScreen(
        favorites: favorites,
        onToggleFavorite: toggleFavorite,
      ),
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.pink[100],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
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
                    borderSide:
                    const BorderSide(color: Colors.purpleAccent, width: 1.5),
                  ),
                  filled: true,
                  fillColor: Colors.purple[50],
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: List.generate(
                  (imageData.length / 2).ceil(),
                      (rowIndex) {
                    final first = imageData[rowIndex * 2];
                    final second = (rowIndex * 2 + 1 < imageData.length)
                        ? imageData[rowIndex * 2 + 1]
                        : null;

                    return Row(
                      children: [
                        Expanded(
                          child: _buildBox(first, context),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: second != null
                              ? _buildBox(second, context)
                              : const SizedBox(),
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBox(Map<String, String> item, BuildContext context) {
    final isFavorite = favorites.contains(item);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TutorialScreen(
              title: item['title']!,
              imagePath: item['image']!,
              description: item['description']!,
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
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    color: Colors.white,
                    child: Image.asset(
                      item['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: GestureDetector(
                    onTap: () {
                      toggleFavorite(item);
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                      size: 24,
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
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class TutorialScreen extends StatelessWidget {
  final String title;
  final String imagePath;
  final String description;

  const TutorialScreen({
    required this.title,
    required this.imagePath,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial: $title'),
        backgroundColor: Colors.pink[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'Steps:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              const Text('1. Gather the materials', style: TextStyle(fontSize: 16)),
              const Text('2. Prepare the petals', style: TextStyle(fontSize: 16)),
              const Text('3. Assemble the flower', style: TextStyle(fontSize: 16)),
              const Text('4. Final touches to make it perfect!',
                  style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, String>> favorites;
  final Function(Map<String, String>) onToggleFavorite;

  const FavoritesScreen({
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
          : Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index) {
            final item = favorites[index];
            return Card(
              child: ListTile(
                leading: Image.asset(item['image']!, width: 50, height: 50),
                title: Text(item['title']!),
                subtitle: Text(item['description']!),
                trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () => onToggleFavorite(item),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TutorialScreen(
                        title: item['title']!,
                        imagePath: item['image']!,
                        description: item['description']!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
