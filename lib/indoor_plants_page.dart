import 'package:flutter/material.dart';
import 'plant_model.dart';
import 'plant_card.dart';

class IndoorPlantsPage extends StatelessWidget {
  final List<Plant> plants = [
    Plant(
      name: "Snake Plant",
      imageUrl: "https://images.unsplash.com/photo-1584735429093-ade249c9513a",
      buyUrl: "https://amzn.in/d/snake-plant",
    ),
    Plant(
      name: "ZZ Plant",
      imageUrl: "https://images.unsplash.com/photo-1512428813834-c702c7702b78",
      buyUrl: "https://amzn.in/d/zz-plant",
    ),
    Plant(
      name: "Pothos",
      imageUrl: "https://images.unsplash.com/photo-1598880940080-ff9a29891b85",
      buyUrl: "https://amzn.in/d/pothos",
    ),
    Plant(
      name: "Peace Lily",
      imageUrl: "https://images.unsplash.com/photo-1598880791616-7f8e5c4b2d1a",
      buyUrl: "https://amzn.in/d/peace-lily",
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