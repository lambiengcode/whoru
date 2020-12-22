import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:whoru_mobile/src/models/user.dart';
import 'package:whoru_mobile/src/utils/constants.dart';

class ChatPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2.5,
        brightness: ThemeProvider.of(context).brightness,
        centerTitle: false,
        title: Text(
          "WhoRU",
          style: TextStyle(
            fontSize: _size.width / 16.0,
            fontWeight: FontWeight.w500,
            color: ThemeProvider.of(context).brightness == Brightness.dark
                ? kLightPrimaryColor
                : Colors.black,
            fontFamily: 'Lobster',
          ),
        ),
        actions: <Widget>[
          GestureDetector(
            child: Icon(
              Feather.search,
              size: _size.width / 15.5,
              color: ThemeProvider.of(context).brightness == Brightness.dark
                  ? kLightPrimaryColor
                  : kDarkPrimaryColor,
            ),
          ),
          SizedBox(
            width: 6.0,
          ),
          IconButton(
            icon: Icon(
              Feather.plus_circle,
              size: _size.width / 15.5,
              color: ThemeProvider.of(context).brightness == Brightness.dark
                  ? kLightPrimaryColor
                  : kDarkPrimaryColor,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: 4.0,
          ),
        ],
      ),
      body: Container(),
    );
  }
}
