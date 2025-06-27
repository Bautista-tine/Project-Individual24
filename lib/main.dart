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

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, String>> imageData = [
    {'title': 'Feature 1'},
    {'title': 'Feature 2'},
    {'title': 'Feature 3'},
    {'title': 'Feature 4'},
    {'title': 'Feature 5'},
    {'title': 'Feature 6'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bloozoom',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.purpleAccent[100],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section Title
              Text(
                'User Friendly Features',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),

              // Updated Search Bar
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search features...',
                  prefixIcon: Icon(Icons.search, color: Colors.purple),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.purpleAccent, width: 1.5),
                  ),
                  filled: true,
                  fillColor: Colors.purple[50],
                  contentPadding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 20),
                ),
              ),
              SizedBox(height: 20),

              // Grid with boxes and descriptions below each box
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
                        Expanded(child: _buildBox(first['title']!, context)),
                        SizedBox(width: 10),
                        Expanded(
                          child: second != null
                              ? _buildBox(second['title']!, context)
                              : SizedBox(),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onNavTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  // Updated to create a plain purple box with a tap to navigate to the tutorial
  Widget _buildBox(String title, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the tutorial screen when the box is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TutorialScreen(title: title),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.purple, // Plain purple background
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white, // White text for visibility
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class TutorialScreen extends StatelessWidget {
  final String title;

  TutorialScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial: $title'),
        backgroundColor: Colors.purpleAccent[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tutorial Content
            Text(
              'Tutorial for $title',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'This is the tutorial for $title. Learn how to create a beautiful flower step by step. In this tutorial, we will cover the following steps:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              '1. Gather the materials',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '2. Prepare the petals',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '3. Assemble the flower',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              '4. Final touches to make it perfect!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
