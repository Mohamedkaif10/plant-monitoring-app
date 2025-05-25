import 'package:flutter/material.dart';
import 'plant_model.dart';
import 'plant_card.dart';
import 'indoor_plant_detail_page.dart';

class IndoorPlantsPage extends StatelessWidget {
  final List<Plant> plants = [
    Plant(
      name: "Snake Plant",
      imageUrl: "https://m.media-amazon.com/images/I/61oCPV0EygL._SX679_.jpg",
      buyUrl: "https://amzn.in/d/3HOfMaY",
      description:
          "The Snake Plant, also known as Mother-in-law’s Tongue, is a hardy indoor plant known for its upright, sword-like leaves with striking green and yellow margins. It’s an excellent air purifier, low maintenance, and ideal for beginners.",
      difficulty: "Easy",
      toxicity: "Mildly toxic if ingested",
      waterNeeds: "Low",
      light: "Low to bright indirect light",
      scientificName: "Sansevieria trifasciata",
      family: "Asparagaceae",
      price: "₹399",
    ),
    Plant(
      name: "ZZ Plant",
      imageUrl: "https://m.media-amazon.com/images/I/61ZRN9vL1FL._SX679_.jpg",
      buyUrl: "https://amzn.in/d/0G4crgv",
      description:
          "The ZZ Plant is a popular indoor plant known for its thick, glossy green leaves and ability to thrive on neglect. It's extremely drought-tolerant and handles low-light environments well, making it perfect for beginners or offices.",
      difficulty: "Easy",
      toxicity: "Mildly toxic if ingested",
      waterNeeds: "Low",
      light: "Low to indirect light",
      scientificName: "Zamioculcas zamiifolia",
      family: "Araceae",
      price: "₹499",
    ),
    Plant(
      name: "Pothos",
      imageUrl: "https://m.media-amazon.com/images/I/41WP2XSCwhL.jpg",
      buyUrl: "https://amzn.in/d/cYRdPlI",
      description: "Snake Plant description here...",
      difficulty: "Easy",
      toxicity: "Mild",
      waterNeeds: "Low",
      light: "Indirect",
      scientificName: "Sansevieria trifasciata",
      family: "Asparagaceae",
      price: "₹499",
    ),
    Plant(
      name: "Peace Lily",
      imageUrl: "https://m.media-amazon.com/images/I/71iRMuC+-KL._SX679_.jpg",
      buyUrl: "https://amzn.in/d/cDEslj4",
      description:
          "Aloe Vera is a succulent plant famous for its medicinal properties. It has thick, fleshy leaves filled with a soothing gel used for burns and skin care. It requires minimal maintenance.",
      difficulty: "Easy",
      toxicity: "Toxic to pets",
      waterNeeds: "Low",
      light: "Bright, indirect sunlight",
      scientificName: "Aloe barbadensis miller",
      family: "Asphodelaceae",
      price: "₹249",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indoor Plants'),
        backgroundColor: Colors.green[800],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        padding: EdgeInsets.all(10),
        itemCount: plants.length,
        itemBuilder: (context, index) {
          return PlantCard(
            plant: plants[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlantDetailPage(plant: plants[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
