import 'package:flutter/material.dart';
import 'plant_card.dart'; // Make sure this file exists
import 'plant_model.dart';
import 'indoor_plant_detail_page.dart';

// Define the item builder type
typedef PlantGridItemBuilder = Widget Function(BuildContext, int);

class PlantGrid extends StatelessWidget {
  final List<Plant> plants;
  final PlantGridItemBuilder? itemBuilder; // Optional custom item builder

  const PlantGrid({
    super.key,
    required this.plants,
    this.itemBuilder, // Allow customization if needed
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: plants.length,
      itemBuilder: itemBuilder ?? defaultPlantGridItemBuilder,
    );
  }

  // Default item builder with built-in navigation
  Widget defaultPlantGridItemBuilder(BuildContext context, int index) {
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
  }
}