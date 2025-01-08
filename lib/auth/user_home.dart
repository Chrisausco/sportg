import 'package:flutter/material.dart';
import 'navigation.dart';


class HomeScreen extends StatelessWidget {
  void handleButtonClick(String label) {
    print('$label clicked');
    // Navigate to different screens or perform actions
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.settings, color: Colors.black),
          onPressed: () {
            // Handle settings icon click
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.qr_code_scanner, color: Colors.black),
            onPressed: () {
              // Handle QR code icon click
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            color: Colors.orange[100],
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Icon(Icons.volume_up, color: Colors.orange),
                SizedBox(width: 8.0),
                Expanded(
                  child: Marquee(
                    text:
                        'Announcement on Increasing Liquidity Mining Rewards. Stay tuned for updates!',
                  ),
                ),
              ],
            ),
          ),
          // Announcement card
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green[800],
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'FSP',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Announcement on Spreading False Information Regarding FINSWAP Issuing Sub-Coins',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Learn More click
                    },
                    child: Text('LEARN MORE'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                    ),
                  ),
                ],
              ),
            ),
          ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 1,
              padding: EdgeInsets.all(16.0),
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: [
                _buildGridButton(context, 'Official website', Icons.language),
                _buildGridButton(context, 'Open source code', Icons.code),
                _buildGridButton(context, 'Customer service', Icons.support_agent),
                _buildGridButton(context, 'Launchpool', Icons.description),
                _buildGridButton(context, 'VIP Animation', Icons.movie),
                _buildGridButton(context, 'AST Plan', Icons.book),
                _buildGridButton(context, 'AST Public NFTs', Icons.picture_as_pdf),
                _buildGridButton(context, 'AST Ranking', Icons.loyalty),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRowButton(context, 'Task2Get', Icons.swap_horiz),
                _buildRowButton(context, 'To invite', Icons.person_add),
                _buildRowButton(context, 'Genelogy', Icons.people),
                _buildRowButton(context, 'Helping', Icons.help),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => handleButtonClick('Introduction to SCF'),
              child: Container(
                color: Colors.orangeAccent,
                padding: EdgeInsets.all(16.0),
                margin: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Introduction to SCF\nBlockchain financial model',
                      style: TextStyle(color: Colors.white),
                    ),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      );
  }

  Widget _buildGridButton(BuildContext context, String label, IconData icon) {
    return GestureDetector(
      onTap: () => handleButtonClick(label),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: Colors.green),
          SizedBox(height: 8),
          Text(label, textAlign: TextAlign.center),
        ],
      ),
    );
  }

  Widget _buildRowButton(BuildContext context, String label, IconData icon) {
    return GestureDetector(
      onTap: () => handleButtonClick(label),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30, color: Colors.orange),
          SizedBox(height: 4),
          Text(label),
        ],
      ),
    );
  }
}