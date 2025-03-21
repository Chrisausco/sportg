import 'package:flutter/material.dart';
import 'package:sports_news_app/auth/user_home.dart';
import 'package:sports_news_app/wallet/wallet_screen.dart';



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


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    Sports(),
    ProfitScreen(),
    BrowserScreen(),
    WalletScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_football), label: 'Sports'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Profit'),
          BottomNavigationBarItem(icon: Icon(Icons.web), label: 'Browser'),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
        ],
      ),
    );
  }
}

// Placeholder Screens

class Sports extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Sports', style: TextStyle(fontSize: 24)));
  }
}

class  ProfitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Profit Screen', style: TextStyle(fontSize: 24)));
  }
}

class BrowserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Browser Screen', style: TextStyle(fontSize: 24)));
  }
}

