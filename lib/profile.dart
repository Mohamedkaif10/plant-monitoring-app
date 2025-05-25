import 'package:flutter/material.dart';
import 'settings.dart'; // Import the new SettingsPage
import 'theme.dart';

class ProfilePage extends StatelessWidget {
  final List<Map<String, dynamic>> gardenPlants = [
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTfVwujyxyZ1aSB41zdgHnpY8dPKXr8yka-v6KiiTK2mo_z1fgsSCaj2izG48SePX-lF9Qf184HJ25otkVpid2gQ',
      'name': 'Monstera',
      'statusIcon': Icons.opacity,
      'statusColor': Colors.blue,
      'status': 'Water in 2 days',
    },
    {
      'image':
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSwWxeg9uYxCwB4r_9mHLaMdJi6CG-FC9GbTel7-2zW0zLeKQs6lEvnWvdpivD4r_p3kz7aaydxScCH4Gf6SNmCHQ',
      'name': 'Snake Plant',
      'statusIcon': Icons.wb_sunny,
      'statusColor': Colors.amber,
      'status': 'Needs light',
    },
    {
      'image':
          'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQikKQzzOVUljg7EapNRaVLxBVfTOBSsuchbWADXI1t4eVtXMOAOQCyjgwlbVqew9-aFQZcZ_qmlK6hkvwHIif7IQ',
      'name': 'Peace Lily',
      'statusIcon': Icons.thermostat,
      'statusColor': Colors.red,
      'status': 'Check humidity',
    },
    {
      'image': 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTBJUEymUfUdanDg9ZwiRjATKdqdI1PHPZdx7wW_3XBpxzejf0qzrDs8CuskTE8qrByUlyb8MPGySIH_wnz4LqNVQ',
      'name': 'Succulent',
      'statusIcon': Icons.check_circle,
      'statusColor': Colors.green,
      'status': 'Healthy',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Row(
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
        actions: [
          Row(
            children: [
              Icon(Icons.monetization_on, color: Colors.amber, size: 22),
              SizedBox(width: 2),
              Text('50',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)),
              SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.share, color: Colors.grey[700]),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.settings, color: Colors.grey[700]),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Section
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.lightGreen,
                    child:
                        Icon(Icons.person, size: 32, color: AppColors.primary),
                  ),
                  SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Priya Sharma',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19)),
                      Text('Plant Enthusiast',
                          style: TextStyle(
                              color: AppColors.primary, fontSize: 15)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 18),
              Text('My Garden',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              SizedBox(height: 12),
              GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 0.95,
                children: gardenPlants
                    .map((plant) => _buildPlantCard(plant))
                    .toList(),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlantCard(Map<String, dynamic> plant) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              plant['image'],
              width: double.infinity,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 2),
            child: Text(
              plant['name'],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 10),
            child: Row(
              children: [
                Icon(plant['statusIcon'],
                    color: plant['statusColor'], size: 16),
                SizedBox(width: 5),
                Expanded(
                  child: Text(
                    plant['status'],
                    style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
