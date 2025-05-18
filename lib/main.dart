import 'package:flutter/material.dart';
import 'plant_diagnosis.dart'; // Import PlantDiagnosisPage
import 'plants.dart'; // Import PlantsPage
import 'profile.dart'; // Import ProfilePage
import 'schedule.dart'; // Import the new SchedulePage
import 'image_upload_page.dart'; // Import the new ImageUploadPage
import 'theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'plant_detail_page.dart';
import 'indoor_plants_page.dart';
import 'flowering_plants_page.dart';
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
        // Navigate to PlantsPage when Plants icon is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlantsPage()),
        );
      } else if (index == 2) {
        // Navigate to ImageUploadPage when Diagnosis (QR code) is tapped
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ImageUploadPage()),
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
            icon: Icon(Icons.local_florist),
            label: 'Plants',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Diagnosis',
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
  Future<void> _launchURL() async {
    final Uri url =
        Uri.parse('https://en.wikipedia.org/wiki/Monstera_deliciosa');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

Future<void> _launchCategoryURL(String title) async {
  if (title == 'Indoor Plants') {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => IndoorPlantsPage()),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FloweringPlantsPage()),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.card,
        elevation: 0,
        title: Row(
          children: [
            Row(
              mainAxisSize:
                  MainAxisSize.min, // To prevent the row from expanding
              children: [
                Icon(Icons.spa, color: AppColors.primary),
                SizedBox(width: 8),
                Text(
                  'Plant Pulse',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.emoji_events_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Featured Plant Card
              Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 4, bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: Text(
                        'Monstera Deliciosa',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        "Today's featured tropical beauty, known for its stunning split leaves and easy care requirements.",
                        style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                              side: BorderSide(
                                  color: AppColors.primary, width: 2),
                            ),
                            elevation: 0,
                          ),
                          // In your HomePage's _buildFeaturedPlantCard method, change the button's onPressed:
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlantDetailsPage()),
                            );
                          },
                          child: Text('Learn More',
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCategoryCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
                    title: 'Indoor Plants',
                  ),
                  SizedBox(width: 12),
                  _buildCategoryCard(
                    imageUrl:
                        'https://images.unsplash.com/photo-1465101046530-73398c7f28ca',
                    title: 'Flowering ...',
                  ),
                ],
              ),
              SizedBox(height: 24),
              Text('Seasonal Tips',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildTipCard(
                      icon: Icons.wb_sunny_outlined,
                      title: 'Summer Care',
                      description:
                          'Keep your plants hydrated and protected from intense afternoon sun.',
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _buildTipCard(
                      icon: Icons.opacity,
                      title: 'Watering',
                      description:
                          'Learn the best watering routines for different plants.',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({required String imageUrl, required String title}) {
    return GestureDetector(
      onTap: () => _launchCategoryURL(title),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: 56,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.horizontal(left: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipCard(
      {required IconData icon,
      required String title,
      required String description}) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black, size: 22),
          SizedBox(height: 6),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 2),
          Text(
            description,
            style: TextStyle(fontSize: 13, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}
