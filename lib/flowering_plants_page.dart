import 'package:flutter/material.dart';
import 'plant_model.dart';
import 'plant_card.dart'; // This includes onTap logic
import 'indoor_plant_detail_page.dart'; // Reusing same detail page UI
import 'plant_grid.dart' as grid;

class FloweringPlantsPage extends StatelessWidget {
  final List<Plant> plants = [
    Plant(
      name: "Orchid",
      imageUrl: "https://m.media-amazon.com/images/I/51t3z0qsOlL.jpg",
      buyUrl: "https://amzn.in/d/asoNAxk",
      description:
          "A beautiful orchid plant known for its vibrant flowers and elegance.",
      difficulty: "Easy",
      toxicity: "Mild",
      waterNeeds: "Low",
      light: "Indirect",
      scientificName: "Orchidaceae",
      family: "Orchid Family",
      price: "₹499",
    ),
    Plant(
      name: "Rose",
      imageUrl: "https://m.media-amazon.com/images/I/51qrv+sYfCL._SX679_.jpg",
      buyUrl: "https://amzn.in/d/5UgM6yB",
      description:
          "Classic rose plant with stunning red blooms and pleasant fragrance.",
      difficulty: "Easy",
      toxicity: "Mild",
      waterNeeds: "Medium",
      light: "Full Sun",
      scientificName: "Rosa",
      family: "Rosaceae",
      price: "₹399",
    ),
    Plant(
      name: "Tulip",
      imageUrl: "https://m.media-amazon.com/images/I/71lvf7kpB8L._SX679_.jpg",
      buyUrl: "https://amzn.in/d/eGw51ia",
      description:
          "Colorful tulip plant ideal for indoor and outdoor decoration.",
      difficulty: "Easy",
      toxicity: "Mild",
      waterNeeds: "Moderate",
      light: "Bright Indirect",
      scientificName: "Tulipa",
      family: "Liliaceae",
      price: "₹299",
    ),
    Plant(
      name: "Sunflower",
      imageUrl: "https://m.media-amazon.com/images/I/71rtnViv27L._SX679_.jpg",
      buyUrl: "https://amzn.in/d/429LXXR",
      description:
          "Cheerful sunflower plant that loves direct sunlight and brightens any space.",
      difficulty: "Easy",
      toxicity: "Non-toxic",
      waterNeeds: "High",
      light: "Direct Sunlight",
      scientificName: "Helianthus annuus",
      family: "Asteraceae",
      price: "₹199",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flowering Plants'),
        backgroundColor: Colors.green[800],
      ),
      body: grid.PlantGrid(
        plants: plants,
        // Pass the onTap behavior here
        itemBuilder: (context, index) => PlantCard(
          plant: plants[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlantDetailPage(plant: plants[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
