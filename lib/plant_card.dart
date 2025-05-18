import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'plant_model.dart';

class PlantGrid extends StatelessWidget {
  final List<Plant> plants;

  const PlantGrid({required this.plants});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        crossAxisSpacing: 16, // Horizontal space between cards
        mainAxisSpacing: 16, // Vertical space between cards
        childAspectRatio: 0.8, // Width/height ratio of each card
      ),
      itemCount: plants.length,
      itemBuilder: (context, index) => PlantCard(plant: plants[index]),
    );
  }
}

class PlantCard extends StatelessWidget {
  final Plant plant;

  const PlantCard({required this.plant});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () async {
          if (await canLaunch(plant.buyUrl)) {
            await launch(plant.buyUrl);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Could not launch link')),
            );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image part (top 70% of card)
            Expanded(
              flex: 7,
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  plant.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                      child: Icon(Icons.error_outline, size: 40),
                    );
                  },
                ),
              ),
            ),
            // Text part (bottom 30% of card)
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      plant.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Buy Now',
                      style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}