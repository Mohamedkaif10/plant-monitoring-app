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
                  imageUrl: 'https://placehold.co/150/png',
                  title: 'Indoor Plants',
                ),
                _buildCategoryCard(
                  context: context,
                  imageUrl: 'https://placehold.co/150/png',
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
                  imageUrl: 'https://placehold.co/150/png',
                  title: 'Monstera Deliciosa',
                ),
                _buildFamousPlantCard(
                  context: context,
                  imageUrl: 'https://placehold.co/150/png',
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(3, (index) => Container(
                  width: MediaQuery.of(context).size.width * 0.8, // Adjust width as needed
                  margin: EdgeInsets.only(right: 16),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.green[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Plants can "talk" to each other! They release chemicals through the air and soil to warn nearby plants about pests or stress, helping them prepare for defense. 🌱',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                )),
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
      width: (MediaQuery.of(context).size.width - 48) / 2.3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 60, // Scale down image
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Famous Plant Card
  Widget _buildFamousPlantCard({required BuildContext context, required String imageUrl, required String title}) {
    return Container(
      width: (MediaQuery.of(context).size.width - 48) / 2,
      height: 180,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(13)),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
