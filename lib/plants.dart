import 'package:flutter/material.dart';

class PlantsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous page
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.green[50],
            suffixIcon: Icon(Icons.search, color: Colors.green),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Categories Section
            Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryCard(
                  context: context,
                  imageUrl: 'https://example.com/indoor_plants.jpg', // Replace with actual image URL
                  title: 'Indoor Plants',
                ),
                _buildCategoryCard(
                  context: context,
                  imageUrl: 'https://example.com/flowering_plants.jpg', // Replace with actual image URL
                  title: 'Flowering Plants',
                ),
              ],
            ),
            SizedBox(height: 24),
            // Most Famous Section
            Text(
              'Most Famous',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFamousPlantCard(
                  context: context,
                  imageUrl: 'https://example.com/monstera.jpg', // Replace with actual image URL
                  title: 'Monstera Deliciosa',
                ),
                _buildFamousPlantCard(
                  context: context,
                  imageUrl: 'https://example.com/orange_girl.jpg', // Replace with actual image URL
                  title: 'Orange Girl Pot',
                ),
              ],
            ),
            SizedBox(height: 24),
            // Fun Facts Section
            Text(
              'Fun Facts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Plants can "talk" to each other! They release chemicals through the air and soil to warn nearby plants about pests or stress, helping them prepare for defense. 🌱',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Category Card
  Widget _buildCategoryCard({required BuildContext context, required String imageUrl, required String title}) {
    return Container(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.green[400],
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  // Famous Plant Card
  Widget _buildFamousPlantCard({required BuildContext context, required String imageUrl, required String title}) {
    return Container(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            color: Colors.green[400],
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
