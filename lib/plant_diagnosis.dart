import 'package:flutter/material.dart';
import 'dart:io';
import 'theme.dart';

class PlantDiagnosisPage extends StatelessWidget {
  final Map<String, dynamic>? diagnosisData;
  final File? image;

  PlantDiagnosisPage({this.diagnosisData, this.image});

  @override
  Widget build(BuildContext context) {
    // Use diagnosisData if available, otherwise use default values
    final plantName = diagnosisData?['plantName'] ?? 'Monstera Deliciosa';
    final issue = diagnosisData?['issue'] ?? 'Powdery Mildew Detected';
    final severity = diagnosisData?['severity'] ?? 'Moderate';
    final quickFix = diagnosisData?['quickFix'] ?? 'Apply neem oil spray twice weekly';
    final problemDetails = diagnosisData?['problemDetails'] ?? {
      'issue': 'White powdery substance on leaves indicating fungal infection',
      'effects': 'Reduced photosynthesis, yellowing leaves, stunted growth',
      'causes': ['Poor air circulation', 'High humidity', 'Overcrowded plants']
    };
    final solutions = diagnosisData?['solutions'] ?? {
      'organic': [
        'Mix 1 tablespoon baking soda with 1 liter water, spray weekly',
        'Improve air circulation with a small fan'
      ],
      'chemical': [
        {'name': 'Neem Oil Spray', 'description': '500ml - Suitable for indoor use', 'price': '₹249'},
        {'name': 'Fungicide Solution', 'description': '250ml - Mix 5ml per liter', 'price': '₹399'}
      ]
    };
    final prevention = diagnosisData?['prevention'] ?? {
      'summer': 'Increase ventilation, reduce watering',
      'winter': 'Reduce humidity, maintain warmth'
    };
    final dosAndDonts = diagnosisData?['dosAndDonts'] ?? [
      {'text': 'Water at the base of the plant', 'isDo': true},
      {'text': 'Avoid overcrowding plants', 'isDo': false}
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.card,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Plant Diagnosis',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: AppColors.background,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Plant Image and Diagnosis Header
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: image != null 
                              ? FileImage(image!)
                              : AssetImage('assets/placeholder.png') as ImageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            plantName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.lightRed,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.warning, color: AppColors.error, size: 16),
                                SizedBox(width: 4),
                                Text(
                                  issue,
                                  style: TextStyle(color: AppColors.error, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              Text('Severity: '),
                              Icon(Icons.circle, color: AppColors.error, size: 10),
                              Icon(Icons.circle, color: AppColors.error, size: 10),
                              Icon(Icons.circle, color: AppColors.grey, size: 10),
                              SizedBox(width: 4),
                              Text(severity),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Quick Fix Section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lightbulb_outline, color: AppColors.secondary),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Quick Fix: $quickFix',
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
                title: 'What\'s the Issue?',
                content: problemDetails['issue'],
                color: AppColors.error,
              ),
              _buildDetailSection(
                title: 'Effects on Plant',
                content: problemDetails['effects'],
                color: AppColors.warning,
              ),
              SizedBox(height: 8),
              Text(
                'Possible Causes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              ...problemDetails['causes'].map<Widget>((cause) => _buildBulletPoint(cause)),
              SizedBox(height: 16),
              // Recommended Solutions
              Text(
                'Recommended Solutions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.eco, color: AppColors.primary),
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
                  color: AppColors.lightGreen,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: solutions['organic'].map<Widget>((solution) => _buildCheckPoint(solution)).toList(),
                ),
              ),
              SizedBox(height: 16),
              // Chemical Solution
              Text(
                'Chemical Solution',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.secondary),
              ),
              SizedBox(height: 8),
              Text(
                'Recommended Products:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ...solutions['chemical'].map<Widget>((product) => _buildProductCard(
                product['name'],
                product['description'],
                product['price'],
              )),
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
                      'Summer',
                      prevention['summer'],
                      Icons.wb_sunny,
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: _buildCareCard(
                      'Winter',
                      prevention['winter'],
                      Icons.ac_unit,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Text(
                'Do\'s & Don\'ts',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              ...dosAndDonts.map<Widget>((item) => _buildDoDont(item['text'], item['isDo'])),
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
                value: 3 / 14,
                backgroundColor: AppColors.grey,
                color: AppColors.primary,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Log Today\'s Progress'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSection({
    required String title,
    required String content,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 4,
          height: 40,
          color: color,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
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
    return Padding(
      padding: EdgeInsets.only(left: 16, bottom: 4),
      child: Row(
        children: [
          Icon(Icons.circle, size: 8),
          SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget _buildCheckPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.green),
          SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Widget _buildProductCard(String name, String description, String price) {
    return Card(
      margin: EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(description),
            SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCareCard(String season, String care, IconData icon) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Icon(icon, color: Colors.blue),
            SizedBox(height: 8),
            Text(
              season,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(care),
          ],
        ),
      ),
    );
  }

  Widget _buildDoDont(String text, bool isDo) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(
            isDo ? Icons.check_circle : Icons.cancel,
            color: isDo ? Colors.green : Colors.red,
          ),
          SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}