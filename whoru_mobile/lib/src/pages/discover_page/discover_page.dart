import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:whoru_mobile/src/models/user.dart';
import 'package:whoru_mobile/src/pages/discover_page/widgets/discover.dart';
import 'package:whoru_mobile/src/utils/constants.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  List<Widget> _pages = [
    Discover(),
    Discover(),
    Discover(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: _pages.length,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        brightness: ThemeProvider.of(context).brightness,
        centerTitle: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: Firestore.instance
                  .collection('users')
                  .where('id', isEqualTo: user.uid)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }

                String urlToImage = snapshot.data.documents[0]['urlToImage'];

                return CircleAvatar(
                  radius: 17.5,
                  backgroundColor: Colors.grey.shade300,
                  child: CircleAvatar(
                    backgroundImage: urlToImage == ''
                        ? AssetImage('images/logo.png')
                        : NetworkImage(urlToImage),
                    radius: 16.0,
                  ),
                );
              },
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(
                      30.0,
                    ),
                  ),
                  padding: EdgeInsets.only(
                    left: 12.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Feather.search,
                        size: 18.0,
                        color: Colors.grey.shade700,
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Feather.tv,
              size: _size.width / 15.6,
              color: ThemeProvider.of(context).brightness == Brightness.dark
                  ? kLightPrimaryColor
                  : kDarkPrimaryColor,
            ),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.blueAccent,
          indicatorColor: Colors.blueAccent,
          unselectedLabelColor: Colors.grey.shade700,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2.5,
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: _size.width / 22.8,
            fontFamily: 'UbuntuMono',
          ),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: _size.width / 23.5,
            fontFamily: 'UbuntuMono',
          ),
          tabs: [
            Tab(
              text: 'Discover',
            ),
            Tab(
              text: 'Photos',
            ),
            Tab(
              text: 'Trending',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _pages.map((Widget tab) {
          return tab;
        }).toList(),
      ),
    );
  }
}
