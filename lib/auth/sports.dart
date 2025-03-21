import 'package:flutter/material.dart';

class Sports extends StatelessWidget {
  const Sports({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Sports news', style: TextStyle(color: Colors.white, fontSize: 24,),),
        backgroundColor: Colors.orange,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          // Top Categories Row
          Container(
            color: Colors.white,
            padding:const EdgeInsets.symmetric(vertical: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryButton('NFL'),
                  _buildCategoryButton('Soccer'),
                  _buildCategoryButton('NBA'),
                  _buildCategoryButton('MLB'),
                  _buildCategoryButton('Other Sports'),
                ],
              ),
            ),
          ),
          // Main Content
          Expanded(
            child: ListView(
              padding:const EdgeInsets.all(10),
              children: [
                _buildHeadlineCard(
                  'Howard hits out at "stupid" Pulisic over \'Trump dance\'',
                  'assets/images/logo.jpg', // Replace with your image path or URL
                  'SOCCER',
                ),
                _buildNewsCard(
                  'MLB dumps Puerto Rico and Mexico from 2025 schedule',
                  'MLB',
                'assets/images/logo.jpg', // Replace with your image path or URL
                ),
                _buildNewsCard(
                  'Yankees and Dodgers on the hunt for hitting',
                  'MLB',
                   'assets/images/logo.jpg', // Replace with your image path or URL
                ),
                _buildNewsCard(
                  '\'Blood, sweat, tears\': The NFL season heats up',
                  'NFL',
                   'assets/images/logo.jpg', // Replace with your image path or URL
                ),
                Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.network(
                'https://apiv3.apifootball.com/badges/logo_country/44_england.png', // Replace with the image of Aaron Rodgers
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              const Positioned(
                bottom: 10,
                left: 16,
                child: Text(
                  'Top stories of the 2024 NFL season',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
                ListTile(
            leading: Image.network(
              'https://apiv3.apifootball.com/badges/logo_country/6_spain.png', // Replace with the Cowboys image
              width: 100,
              fit: BoxFit.cover,
            ),
            title: Text('Dallas Cowboys players’ payrolls 2024: full list'),
            subtitle: Text('COWBOYS'),
          ),
          Divider(),
          ListTile(
            leading: Image.network(
              'https://apiv3.apifootball.com/badges/logo_country/6_spain.png', // Replace with the Cowboys image
              width: 100,
              fit: BoxFit.cover,
            ),
            title: Text('Dallas Cowboys players’ payrolls 2024: full list'),
            subtitle: Text('COWBOYS'),
          ),
          Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(title),
      ),
    );
  }

  Widget _buildHeadlineCard(String title, String image, String category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(image, height: 200, fit: BoxFit.cover), // Use NetworkImage for web
        SizedBox(height: 8),
        Text(
          category.toUpperCase(),
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Divider(thickness: 1),
      ],
    );
  }

  Widget _buildNewsCard(String title, String category, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}