import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PlantDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monstera Deliciosa'),
        backgroundColor: Colors.green[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Plant Image
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                'https://m.media-amazon.com/images/I/61RwYODKheL._SX679_.jpg',
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            
            // Description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Monstera deliciosa, the Swiss cheese plant or split-leaf philodendron is a species of flowering plant native to tropical forests of southern Mexico, south to Panama",
                style: TextStyle(fontSize: 16),
              ),
            ),
            
            // Do's and Don'ts
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.lightGreen[50],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.lightGreen[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Care Tips",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.green[800],
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildTipItem("Water when top soil feels dry"),
                  _buildTipItem("Mist leaves regularly"),
                  _buildTipItem("Provide bright, indirect light"),
                  _buildTipItem("Avoid direct afternoon sun"),
                ],
              ),
            ),
            
            SizedBox(height: 20),
            
            // Difficulty and Water Needs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoItem("Difficulty", "Easy"),
                  _buildInfoItem("Water Needs", "Moderate"),
                ],
              ),
            ),
            
            SizedBox(height: 30),
            
            // Buy Now Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                style: ElevatedButton.styleFrom(
  backgroundColor: Colors.amber[700],
  foregroundColor: Colors.black,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
  ),
),

                  onPressed: () async {
                    final url = 'https://amzn.in/d/dMHmBn4';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Could not launch Amazon link')),
                      );
                    }
                  },
                  child: Text(
                    'BUY NOW',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green[600], size: 20),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.green[800],
          ),
        ),
      ],
    );
  }
}