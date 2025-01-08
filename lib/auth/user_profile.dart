import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://via.placeholder.com/150', // Replace with your image URL
              ),
            ),
             SizedBox(height: 10),
             Text(
              'Ahmed Wahid',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
             SizedBox(height: 5),
             Text(
              'ID: AH698J42F3',
              style: TextStyle(color: Colors.grey),
            ),
             SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  buildMenuItem(Icons.person, 'User profile',
                      'Change profile image, name or password'),
                  buildMenuItem(Icons.star, 'Premium plans',
                      'Explore premium options and enjoy'),
                  buildMenuItem(Icons.account_balance, 'Accounts',
                      'Manage accounts and description'),
                  buildMenuItem(Icons.attach_money, 'Currencies',
                      'Add other currencies, adjust exchange rates'),
                  buildMenuItem(Icons.category, 'Categories',
                      'Manage categories and add sub-categories'),
                  buildMenuItem(Icons.security, 'Security',
                      'Protect your app with PIN or Fingerprint'),
                ],
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey, fontSize: 14),
      ),
      onTap: () {},
    );
  }
}