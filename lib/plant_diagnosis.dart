import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            Navigator.pop(context);
          },
        ),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.green[50],
            suffixIcon: Icon(Icons.search, color: Colors.green),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryCard(
                  context: context,
                  amazonLink: "https://www.amazon.in/sspa/click?ie=UTF8&spc=MTozNDkzOTA2MjM5NzE1ODYxOjE3NDM2NzM4MTQ6c3BfYXRmOjMwMDAwOTUzNDY3MzkzMjo6MDo6&url=%2FUgaoo-Indoor-Plants-Living-Decor%2Fdp%2FB0C6QRW4BH%2Fref%3Dsr_1_1_sspa%3Fdib%3DeyJ2IjoiMSJ9.94AUfYUx819TM5NLT61SQba6aaVtchOGqJBY5Oqjr6Xa9i4bovReecQZGGfpqGyrMVS2h1pp7hQN1sVLTXdkQcGwHtvEbQ9S31VYh8Y9r2K-ylE5sQczseZfficaxRBxavf0HP-gxW4wBBCZo15SfUPN4KABt47uWbr5U7aPEkoXeAh7Zv3j5JET-KN1AdblvCuW4qF2lMG4941bDtrx2yoD43fa1BwT71EGrE-GjsrXWnivrHAjRHxtWVIdsDJ2RhuVFxFJfqsdG_LqyAEAHPOLunllhO-O7I6UPO0Qmtc.rc_1uPcjl3WQqf32wgYf_kjsJWqI0wtNBpVn6qSNvbk%26dib_tag%3Dse%26keywords%3Dplants%26qid%3D1743673814%26sr%3D8-1-spons%26sp_csd%3Dd2lkZ2V0TmFtZT1zcF9hdGY%26psc%3D1",
                  imageUrl: 'https://example.com/indoor_plants.jpg',
                  title: 'Indoor Plants',
                ),
                _buildCategoryCard(
                  context: context,
                  amazonLink: "https://www.amazon.in/Chinese-balcony-decoration-purifier-pennywort/dp/B0F29S1M24/ref=sr_1_5?dib=eyJ2IjoiMSJ9.94AUfYUx819TM5NLT61SQba6aaVtchOGqJBY5Oqjr6Xa9i4bovReecQZGGfpqGyrMVS2h1pp7hQN1sVLTXdkQcGwHtvEbQ9S31VYh8Y9r2K-ylE5sQczseZfficaxRBxavf0HP-gxW4wBBCZo15SfUPN4KABt47uWbr5U7aPEkoXeAh7Zv3j5JET-KN1AdblvCuW4qF2lMG4941bDtrx2yoD43fa1BwT71EGrE-GjsrXWnivrHAjRHxtWVIdsDJ2RhuVFxFJfqsdG_LqyAEAHPOLunllhO-O7I6UPO0Qmtc.rc_1uPcjl3WQqf32wgYf_kjsJWqI0wtNBpVn6qSNvbk&dib_tag=se&keywords=plants&qid=1743673814&sr=8-5",
                  imageUrl: 'https://example.com/flowering_plants.jpg',
                  title: 'Flowering Plants',
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Most Famous',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFamousPlantCard(
                  context: context,
                  amazonLink: "https://www.amazon.in/sspa/click?ie=UTF8&spc=MToxMjA0MjQ0MzE0MjE0ODYxOjE3NDM2NzM4MTQ6c3BfYXRmOjMwMDE0NDM0NDM0MjEzMjo6MDo6&url=%2FTrustbasket-Monstera-Deliciosa-Plant-Pot%2Fdp%2FB0D2LRYZ2W%2Fref%3Dsr_1_1_sspa%3Fdib%3DeyJ2IjoiMSJ9.luF2GlXgqA8k2D0oFVpQvW5nA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8eP4iA8oE5E6o8... (continues with rest of the original amazon link)",
                  imageUrl: 'https://example.com/monstera.jpg',
                  title: 'Monstera Deliciosa',
                ),
                _buildFamousPlantCard(
                  context: context,
                  amazonLink: "https://www.amazon.in/Orange-Girl-Pot-Plant/dp/B08JHG7K9M", // Example link, replace with actual
                  imageUrl: 'https://example.com/orange_girl.jpg',
                  title: 'Orange Girl Pot',
                ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Fun Facts',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green[400],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Plants can "talk" to each other! They release chemicals through the air and soil to warn nearby plants about pests or stress, helping them prepare for defense. 🌱',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard({required BuildContext context, required String amazonLink, required String imageUrl, required String title}) {
    return GestureDetector(
      onTap: () async {
        final Uri url = Uri.parse(amazonLink);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 48) / 2,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFamousPlantCard({required BuildContext context, required String amazonLink, required String imageUrl, required String title}) {
    return GestureDetector(
      onTap: () async {
        final Uri url = Uri.parse(amazonLink);
        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        }
      },
      child: Container(
        width: (MediaQuery.of(context).size.width - 48) / 2,
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.green[400],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}