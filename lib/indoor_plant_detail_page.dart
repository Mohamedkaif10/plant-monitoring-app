import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'plant_model.dart';
import 'package:card_swiper/card_swiper.dart'; // NEW - from card_swiper

class PlantDetailPage extends StatelessWidget {
  final Plant plant;

  const PlantDetailPage({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(plant.name),
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Banner
            Image.network(
              plant.imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),

            // Price and Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  plant.price,
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "₹599",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Description
            Text(
              "Description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              plant.description,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 24),

            // Swipeable Does & Don'ts Section
            Text(
              "Does & Don'ts",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              height: 150, // Adjust height as needed
              child: Swiper(
                itemCount: 2,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    // "Does" Card
                    return _buildSwipeCard(
                      icon: Icons.check_circle,
                      label: "Does",
                      items: [
                        "Water when top soil feels dry",
                        "Place in bright, indirect light",
                        "Mist leaves regularly",
                      ],
                      backgroundColor: Colors.lightGreenAccent,
                    );
                  } else {
                    // "Don'ts" Card
                    return _buildSwipeCard(
                      icon: Icons.clear,
                      label: "Don'ts",
                      items: [
                        "Overwater the plant",
                        "Place in direct sunlight",
                        "Let the soil dry out completely",
                      ],
                      backgroundColor: Colors.red.shade300,
                    );
                  }
                },
                pagination: SwiperPagination(),
                control: SwiperControl(),
              ),
            ),
            SizedBox(height: 24),

            // Difficulty, Toxicity, Water Needs, Light
            _buildInfoSection(
              icon: Icons.star,
              label: "Difficulty",
              value: plant.difficulty,
            ),
            _buildInfoSection(
              icon: Icons.warning,
              label: "Toxicity",
              value: plant.toxicity,
            ),
            _buildInfoSection(
              icon: Icons.water_drop,
              label: "Water Needs",
              value: plant.waterNeeds,
            ),
            _buildInfoSection(
              icon: Icons.wb_sunny,
              label: "Light",
              value: plant.light,
            ),
            SizedBox(height: 24),

            // Taxonomy
            Text(
              "Taxonomy",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Table(
              defaultColumnWidth: FlexColumnWidth(),
              border: TableBorder.all(color: Colors.grey[300]!, width: 0.5),
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Scientific Name",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(plant.scientificName),
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "Family",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Text(plant.family),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 24),

            // Buy Now Button
            ElevatedButton(
              onPressed: () async {
                if (await canLaunchUrl(Uri.parse(plant.buyUrl))) {
                  await launchUrl(Uri.parse(plant.buyUrl));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not launch link')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              child: Text(
                "Buy Now · ${plant.price}",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable widget for Swipeable Cards
  Widget _buildSwipeCard({
    required IconData icon,
    required String label,
    required List<String> items,
    required Color backgroundColor,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.green[800]),
              SizedBox(width: 8),
              Text(label),
            ],
          ),
          SizedBox(height: 8),
          ...items.map((item) => Row(
                children: [
                  Icon(Icons.circle, size: 8, color: Colors.green[800]),
                  SizedBox(width: 8),
                  Text(item),
                ],
              )).toList(),
        ],
      ),
    );
  }

  // Reusable widget for Difficulty, Toxicity, etc.
  Widget _buildInfoSection({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, color: Colors.green[800]),
              SizedBox(width: 8),
              Text(label),
            ],
          ),
          Text(value),
        ],
      ),
    );
  }
}