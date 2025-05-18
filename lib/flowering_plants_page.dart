import 'package:flutter/material.dart';
import 'plant_model.dart';
import 'plant_card.dart';

class FloweringPlantsPage extends StatelessWidget {
  final List<Plant> plants = [
    Plant(
      name: "Orchid",
      imageUrl: "https://images.unsplash.com/photo-1518843875459-f738682238a6",
      buyUrl: "https://amzn.in/d/orchid",
    ),
    Plant(
      name: "Rose",
      imageUrl: "https://images.unsplash.com/photo-1517059224940-d4af9eec41b7",
      buyUrl: "https://amzn.in/d/rose",
    ),
    Plant(
      name: "Tulip",
      imageUrl: "https://images.unsplash.com/photo-1526397751294-331021109fbd",
      buyUrl: "https://amzn.in/d/tulip",
    ),
    Plant(
      name: "Sunflower",
      imageUrl: "https://images.unsplash.com/photo-1597848212624-a19eb35e2651",
      buyUrl: "https://amzn.in/d/sunflower",
    ),
  ];

 // In indoor_plants_page.dart and flowering_plants_page.dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Indoor Plants'), // or 'Flowering Plants'
      backgroundColor: Colors.green[800],
    ),
    body: PlantGrid(plants: plants), // Use PlantGrid instead of ListView
  );
}
}