import 'package:flutter/material.dart';
import 'package:sports_news_app/top_stories/pages/top_story_page.dart';



class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  // List of screens based on selected index
  static final List<Widget> _widgetOptions =  <Widget>[
    const TopStoryPage(),
    Container(color: Colors.green, child: const Center(child: Text('Live Scores', style: TextStyle(fontSize: 24)))),
    Container(color: Colors.yellow, child: const Center(child: Text('Results', style: TextStyle(fontSize: 24)))),
    Container(color: Colors.grey, child: const Center(child: Text('Videos', style: TextStyle(fontSize: 24)))),
    Container(color: Colors.orange, child: const Center(child: Text('Me', style: TextStyle(fontSize: 24)))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items:[
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
            label: 'Top Stories'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer),
            label: 'Live Scores'
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.score),
            label: 'Results'
          ),
          BottomNavigationBarItem(
             icon: Icon(Icons.play_circle_fill),
            label: 'videos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
          currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        )
    );
  }
}