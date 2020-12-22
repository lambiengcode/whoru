import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru_mobile/src/pages/chat_page/chat_page.dart';
import 'package:whoru_mobile/src/pages/discover_page/discover_page.dart';
import 'package:whoru_mobile/src/pages/home_page/home_page.dart';
import 'package:whoru_mobile/src/pages/profile_page/profile_page.dart';

class Navigation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> with WidgetsBindingObserver {
  int currentPage = 0;
  var _pages = [
    ChatPage(),
    HomePage(),
    DiscoverPage(),
    ProfilePage(),
  ];
  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    WidgetsBinding.instance.addObserver(this);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
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
          elevation: 1.5,
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
                icon: Icon(Feather.home), title: Text("Message")),
            BottomNavigationBarItem(
                icon: Icon(Feather.feather), title: Text("Feed")),
            BottomNavigationBarItem(
                icon: Icon(Feather.search), title: Text("Discover")),
            BottomNavigationBarItem(
                icon: Icon(Feather.user), title: Text("Profile")),
          ],
        ),
        body: _pages[currentPage],
      ),
    );
  }
}
