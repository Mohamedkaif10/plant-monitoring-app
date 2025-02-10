import 'package:flutter/material.dart';

void main() {
  runApp(const PlantCareApp());
}

class PlantCareApp extends StatelessWidget {
  const PlantCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'PlantCare',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),

            // Plant Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.asset(
                        'assets/plant.jpg',
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Monstera Deliciosa',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'The Swiss Cheese Plant - Perfect for bringing tropical vibes to your space',
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey[700]),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: () {},
                            child: Text('Learn More'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 10),

            // Quick Actions Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Text(
                "Quick Actions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _featureBox(Icons.camera_alt, "Scan Plant"),
                  _featureBox(Icons.dashboard, "Care Dashboard"),
                  _featureBox(Icons.flag, "Start Challenge"),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Seasonal Tips Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Seasonal Tips",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 120,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(5, (index) => SeasonalTipCard()),
                ),
              ),
            ),

            SizedBox(height: 10),

            // Plant Journey Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Your Plant Journey",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildJourneyInfo(
                          "7 Day Streak", Icons.local_fire_department),
                      _buildJourneyInfo("12 Badges", Icons.emoji_events),
                      _buildJourneyInfo("Level 5", Icons.star),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Footer Section
            Container(
              color: Colors.black87,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Quick Links",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("About Us | Contact | Blog",
                      style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 16),
                  Text("Policies",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("Privacy Policy | Terms of Service | Refund Policy",
                      style: TextStyle(color: Colors.white70)),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.facebook, color: Colors.white),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Quick Action Box
  Widget _featureBox(IconData icon, String label) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              Icon(icon, size: 30, color: Colors.green),
              SizedBox(height: 8),
              Text(label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }

  // Seasonal Tip Card
  Widget SeasonalTipCard() {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: SizedBox(
        width: 200,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: Icon(Icons.wb_sunny, color: Colors.orange),
            title: Text("Summer Care"),
            subtitle: Text("Keep your plants "),
            trailing: Icon(Icons.arrow_forward, color: Colors.blue),
            onTap: () {},
          ),
        ),
      ),
    );
  }

  // Plant Journey Info
  Widget _buildJourneyInfo(String text, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 28, color: Colors.green),
        SizedBox(height: 5),
        Text(text, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
