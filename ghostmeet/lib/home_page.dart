import 'package:flutter/material.dart';
import 'package:ghostmeet/videoGrid.dart';
import 'my_info.dart';
import 'dicePage.dart';
import 'messageScreen.dart';
import 'friendCirclePage.dart';
// import 'message_page.dart';
// import 'discover_page.dart';

class BottomNavigationBarDemo extends StatefulWidget {
  @override
  _BottomNavigationBarDemoState createState() =>
      _BottomNavigationBarDemoState();
}

class _BottomNavigationBarDemoState extends State<BottomNavigationBarDemo> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // HomePage(),
    // MessagePage(),
    // DiscoverPage(),
    DicePage(),
    MessageScreen(),
    FriendCirclePage(),
    ProfilePage(), //个人主页
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
