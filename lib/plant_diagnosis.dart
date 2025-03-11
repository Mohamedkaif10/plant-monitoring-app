import 'package:flutter/material.dart';

class PlantDiagnosisPage extends StatelessWidget {
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
        title: Text(
          'Plant Diagnosis',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Plant Image and Diagnosis Header
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage('https://example.com/monstera.jpg'), // Replace with actual image URL
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Monstera Deliciosa',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.warning, color: Colors.red, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Powdery Mildew Detected',
                            style: TextStyle(color: Colors.red, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Text('Severity: '),
                        Icon(Icons.circle, color: Colors.red, size: 10),
                        Icon(Icons.circle, color: Colors.red, size: 10),
                        Icon(Icons.circle, color: Colors.grey, size: 10),
                        SizedBox(width: 4),
                        Text('Moderate'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            // Quick Fix Section
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(Icons.lightbulb_outline, color: Colors.blue),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Quick Fix: Apply neem oil spray twice weekly',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Problem Details Section
            Text(
              'Problem Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildDetailSection(
              title: 'What\'s the issue?',
              content: 'White powdery substance on leaves indicating fungal infection',
              color: Colors.red,
            ),
            _buildDetailSection(
              title: 'Effects on Plant',
              content: 'Reduced photosynthesis, yellowing leaves, stunted growth',
              color: Colors.orange,
            ),
            SizedBox(height: 8),
            Text(
              'Possible Causes',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            _buildBulletPoint('Poor air circulation'),
            _buildBulletPoint('High humidity'),
            _buildBulletPoint('Overcrowded plants'),
            SizedBox(height: 16),
            // Recommended Solutions
            Text(
              'Recommended Solutions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.eco, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  'Organic Solution',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _buildCheckPoint(
                      'Mix 1 tablespoon baking soda with 1 liter water, spray weekly'),
                  _buildCheckPoint('Improve air circulation with a small fan'),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Chemical Solution
            Text(
              'Chemical Solution',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            SizedBox(height: 8),
            Text(
              'Recommended Products:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildProductCard('Neem Oil Spray', '500ml - Suitable for indoor use', '₹249'),
            _buildProductCard('Fungicide Solution', '250ml - Mix 5ml per liter', '₹399'),
            SizedBox(height: 16),
            // Prevention & Care
            Text(
              'Prevention & Care',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Seasonal Care',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: _buildCareCard(
                      'Summer', 'Increase ventilation, reduce watering', Icons.wb_sunny),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: _buildCareCard(
                      'Winter', 'Reduce humidity, maintain warmth', Icons.ac_unit),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Do\'s & Don\'ts',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            _buildDoDont('Water at the base of the plant', true),
            _buildDoDont('Avoid overcrowding plants', false),
            SizedBox(height: 16),
            // Progress Tracker
            Text(
              'Progress Tracker',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Treatment Progress'),
                Text('Day 3 of 14'),
              ],
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: 3 / 14, // Day 3 of 14
              backgroundColor: Colors.grey[300],
              color: Colors.green,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Log Today\'s Progress'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailSection(
      {required String title, required String content, required Color color}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 60,
          color: color,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(content),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      children: [
        Icon(Icons.circle, size: 6),
        SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }

  Widget _buildCheckPoint(String text) {
    return Row(
      children: [
        Icon(Icons.check, color: Colors.green),
        SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }

  Widget _buildProductCard(String title, String subtitle, String price) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.purple[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(subtitle, style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
          Text(price, style: TextStyle(fontSize: 16, color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildCareCard(String title, String content, IconData icon) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: icon == Icons.wb_sunny ? Colors.orange[50] : Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20),
              SizedBox(width: 8),
              Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 4),
          Text(content),
        ],
      ),
    );
  }

  Widget _buildDoDont(String text, bool isDo) {
    return Row(
      children: [
        Icon(isDo ? Icons.check : Icons.close, color: isDo ? Colors.green : Colors.red),
        SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }
}