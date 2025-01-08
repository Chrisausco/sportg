import 'package:flutter/material.dart';
import 'package:sports_news_app/auth/user_home.dart';



// Custom Marquee Widget
class Marquee extends StatefulWidget {
  final String text;
  Marquee({required this.text});

  @override
  _MarqueeState createState() => _MarqueeState();
}

class _MarqueeState extends State<Marquee> with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
  }

  void _startScrolling() async {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      if (_scrollController.hasClients) {
        await _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 5),
          curve: Curves.linear,
        );
        await _scrollController.animateTo(
          0.0,
          duration: Duration(seconds: 1),
          curve: Curves.linear,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: Text(
        widget.text,
        style: TextStyle(fontSize: 14.0, color: Colors.orange[800]),
      ),
    );
  }

  @override 
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text("Home Page")),
    Center(child: Text("FSP Page")),
    Center(child: Text("Profit Page")),
    Center(child: Text("Browser Page")),
    Center(child: Text("Wallet Page")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sync_alt),
            label: 'FSP',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Profit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Browser',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange, // Selected color
        unselectedItemColor: Colors.grey, // Unselected color
        onTap: _onItemTapped,
      ),
    );
  }
}