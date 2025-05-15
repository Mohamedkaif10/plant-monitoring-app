import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:url_launcher/url_launcher.dart';

class PlantsPage extends StatelessWidget {
  // Define the plant arrays as Dart lists
  final List<Map<String, String>> indoorplants = [
    {
      'title': 'Purple Lavender Flower',
      'imageUrl': 'https://m.media-amazon.com/images/I/71k6mZIN6xL._SX679_.jpg',
      'subtitle': 'Live Wonderful All Season Purple Lavender Flower Tree Healthy Live Plant For Home Garden Outdoor Indoor plant',
    },
    {
      'title': 'Gandharaj Live Plant',
      'imageUrl': 'https://m.media-amazon.com/images/I/6176+dL1SNL._SX679_.jpg',
      'subtitle': 'All Seasons Gardenia/Gandharaj Live Plant - Fragrant Blooms Choice for gardens and indoor spaces',
    },
  ];

  final List<Map<String, String>> floweringplants = [
    {
      'title': 'Purple Lavender Flower',
      'imageUrl': 'https://m.media-amazon.com/images/I/71k6mZIN6xL._SX679_.jpg',
      'subtitle': 'Live Wonderful All Season Purple Lavender Flower Tree Healthy Live Plant For Home Garden Outdoor Indoor plant',
    },
    {
      'title': 'Gandharaj Live Plant',
      'imageUrl': 'https://m.media-amazon.com/images/I/6176+dL1SNL._SX679_.jpg',
      'subtitle': 'All Seasons Gardenia/Gandharaj Live Plant - Fragrant Blooms Choice for gardens and indoor spaces',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.card,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        title: Container(
          height: 44,
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search plants...',
              hintStyle: TextStyle(color: AppColors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: AppColors.background,
              prefixIcon: Icon(Icons.search, color: AppColors.grey),
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryCard(
                  context: context,
                  icon: Icons.eco,
                  title: 'Indoor Plants',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlantCategoryPage(
                          categoryTitle: 'Indoor Plants',
                          plants: indoorplants,
                        ),
                      ),
                    );
                  },
                ),
                _buildCategoryCard(
                  context: context,
                  icon: Icons.local_florist,
                  title: 'Flowering Plants',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PlantCategoryPage(
                          categoryTitle: 'Flowering Plants',
                          plants: floweringplants,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                'Most Famous',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 0.8,
                children: [
                  _buildFamousPlantCard(
                    context: context,
                    imageUrl: 'https://m.media-amazon.com/images/I/61nywQ21yqL._SX679_.jpg',
                    title: 'Ugaoo Air Purifying Bamboo Palm',
                    subtitle: 'Live Plant With Grow Pot',
                  ),
                  _buildFamousPlantCard(
                    context: context,
                    imageUrl: 'https://m.media-amazon.com/images/I/31DL28fs4-L.jpg',
                    title: 'Areca Palm',
                    subtitle: 'Indoor air purifying plants for living room Natural Live A Big Size "Areca Palm" Tree',
                  ),
                  _buildFamousPlantCard(
                    context: context,
                    imageUrl: 'https://m.media-amazon.com/images/I/41mH3c+M0hL.jpg',
                    title: 'Desert Roses Live Flower Plant',
                    subtitle: 'Cloud Farm Bonsai Air Layered Adenium/Desert Roses Live Flower Plant',
                  ),
                  _buildFamousPlantCard(
                    context: context,
                    imageUrl: 'https://m.media-amazon.com/images/I/71kCOMzV0TL._SX679_.jpg',
                    title: 'Pothos',
                    subtitle: 'Pothos plant',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Text(
                'Fun Facts',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Did you know?',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Plants can "talk" to each other! They release chemicals into the soil to warn nearby plants about threats and share success through ...',
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // Category Card
  Widget _buildCategoryCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 164,
        height: 60,
        margin: EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 28),
            SizedBox(width: 8),
            Flexible(
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Famous Plant Card
  Widget _buildFamousPlantCard({
    required BuildContext context,
    required String imageUrl,
    required String title,
    required String subtitle,
  }) {
    return GestureDetector(
      onTap: () async {
        final Uri url = Uri.parse('https://example.com'); // Replace with your link
        if (!await launchUrl(url)) {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        width: 172,
        height: 210,
        decoration: BoxDecoration(
          color: AppColors.card,
          border: Border.all(color: AppColors.primary, width: 1.5),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(color: AppColors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// New page to display plants for a specific category
class PlantCategoryPage extends StatelessWidget {
  final String categoryTitle;
  final List<Map<String, String>> plants;

  const PlantCategoryPage({
    Key? key,
    required this.categoryTitle,
    required this.plants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.card,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          categoryTitle,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          childAspectRatio: 0.8,
          children: plants.map((plant) {
            return _buildCategoryPlantCard(
              context: context,
              imageUrl: plant['imageUrl']!,
              title: plant['title']!,
              subtitle: plant['subtitle']!,
            );
          }).toList(),
        ),
      ),
    );
  }

  // Reusable plant card for category page (same design as famous plant card)
  Widget _buildCategoryPlantCard({
    required BuildContext context,
    required String imageUrl,
    required String title,
    required String subtitle,
  }) {
    return GestureDetector(
      onTap: () async {
        final Uri url = Uri.parse('https://example.com'); // Replace with your link
        if (!await launchUrl(url)) {
          throw 'Could not launch $url';
        }
      },
      child: Container(
        width: 172,
        height: 210,
        decoration: BoxDecoration(
          color: AppColors.card,
          border: Border.all(color: AppColors.primary, width: 1.5),
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: EdgeInsets.only(bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 110,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(color: AppColors.grey, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}