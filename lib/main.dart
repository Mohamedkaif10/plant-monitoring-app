import 'package:flutter/material.dart';
import 'plant_diagnosis.dart'; // Import PlantDiagnosisPage
import 'plants.dart'; // Import PlantsPage
import 'profile.dart'; // Import ProfilePage
import 'schedule.dart'; // Import the new SchedulePage
import 'image_upload_page.dart'; // Import the new ImageUploadPage

void main() {
  runApp(PlantGuruApp());
}

class PlantGuruApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    HomePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      if (index == 1) {
        // Navigate to ImageUploadPage when QR code is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ImageUploadPage()),
        );
      } else if (index == 2) {
        // Navigate to PlantsPage when plant logo is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlantsPage()),
        );
      } else if (index == 3) {
        // Navigate to SchedulePage when watering can is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SchedulePage()),
        );
      } else if (index == 4) {
        // Navigate to ProfilePage when profile icon is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage()),
        );
      } else {
        _selectedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[50],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Diagnosis',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist), // Watering can icon
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<String> plantImages = [
    'https://placehold.co/150/png', // Replace with actual image URLs
    'https://placehold.co/150/png',
    'https://placehold.co/150/png',
  ];
  final List<Map<String, String>> plantDetails = [
    {
      'name': 'Snake Plant',
      'description':
          'The snake plant effortlessly purifies the air while adding a touch of modern elegance to any space...',
    },
    {
      'name': 'Aloe Vera',
      'description':
          'Aloe Vera is known for its soothing properties and low maintenance care...',
    },
    {
      'name': 'Peace Lily',
      'description':
          'The Peace Lily brings tranquility and beauty to any room...',
    },
  ];

  void _nextPlant() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % plantImages.length;
    });
  }

  void _previousPlant() {
    setState(() {
      _currentIndex =
          (_currentIndex - 1 + plantImages.length) % plantImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey[200],
              child: Icon(Icons.landscape, color: Colors.green),
            ),
            SizedBox(width: 8),
            Text(
              'PlantGuru',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  '50',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                SizedBox(width: 4),
                Icon(Icons.star, color: Colors.amber),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(plantImages[_currentIndex]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                left: 24,
                top: 110,
                child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 30),
                  onPressed: _previousPlant,
                ),
              ),
              Positioned(
                right: 24,
                top: 110,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward, size: 30),
                  onPressed: _nextPlant,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plantDetails[_currentIndex]['name']!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  plantDetails[_currentIndex]['description']!,
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 16),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'READ MORE',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              plantImages.length,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? Colors.green : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}