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
          "The Golden Pothos is a versatile and beautiful trailing plant known for its heart-shaped leaves with stunning yellow and green variegation. Perfect for beginners, this air-purifying plant can thrive in various light conditions and helps remove indoor air pollutants.",
      difficulty: "Easy",
      toxicity: "Mild",
      waterNeeds: "Moderate",
      light: "Indirect",
      scientificName: "Epipremium aureum",
      family: "Araceae",
      price: "₹399",
    ),
    Plant(
      name: "ZZ Plant",
      imageUrl: "https://m.media-amazon.com/images/I/61ZRN9vL1FL._SX679_.jpg",
      buyUrl: "https://amzn.in/d/0G4crgv",
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
      description: "Snake Plant description here...",
      difficulty: "Easy",
      toxicity: "Mild",
      waterNeeds: "Low",
      light: "Indirect",
      scientificName: "Sansevieria trifasciata",
      family: "Asparagaceae",
      price: "₹499",
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
