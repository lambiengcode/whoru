import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru/src/pages/chat_page/chat_page.dart';
import 'package:whoru/src/pages/discover_page/discover_page.dart';
import 'package:whoru/src/pages/home_page/home_page.dart';
import 'package:whoru/src/pages/profile_page/profile_page.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPage = 2;
  var _pages = [
    ChatPage(),
    HomePage(),
    DiscoverPage(),
    ProfilePage(),
    ProfilePage(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (i) {
            setState(() {
              currentPage = i;
            });
          },
          type: BottomNavigationBarType.fixed,
          iconSize: _size.width / 14.75,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor:
              ThemeProvider.of(context).brightness == Brightness.dark
                  ? Colors.blueAccent.shade100
                  : Colors.blueAccent.shade400,
          unselectedItemColor:
              ThemeProvider.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade100
                  : Colors.black,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Feather.mail), title: Text("Message")),
            BottomNavigationBarItem(
                icon: Icon(Feather.trending_up), title: Text("Activity")),
            BottomNavigationBarItem(
                icon: Icon(Feather.radio), title: Text("Discover")),
            BottomNavigationBarItem(
                icon: Icon(Feather.clock), title: Text("Clock")),
            BottomNavigationBarItem(
                icon: Icon(Feather.user), title: Text("Profile")),
          ],
        ),
        body: _pages[currentPage],
      ),
    );
  }
}
