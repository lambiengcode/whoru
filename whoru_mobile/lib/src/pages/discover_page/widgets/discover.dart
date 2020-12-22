import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:whoru_mobile/src/models/discover.dart';
import 'package:whoru_mobile/src/utils/constants.dart';

class Discover extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: ThemeProvider.of(context).brightness == Brightness.dark
                      ? Colors.white.withOpacity(.04)
                      : Color(0xFFABBAD5),
                  spreadRadius: .8,
                  blurRadius: 2.0,
                  offset: Offset(0, 2.0), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: _size.width / 5.8,
                      width: _size.width / 5.8,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white10, width: 0.3),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(discovers[0].image),
                            fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            discovers[0].title,
                            style: TextStyle(
                              fontSize: _size.width / 20.0,
                              fontWeight: FontWeight.bold,
                              color: ThemeProvider.of(context).brightness ==
                                      Brightness.dark
                                  ? kLightPrimaryColor
                                  : Colors.blueAccent,
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            discovers[0].subTitle,
                            style: TextStyle(
                              fontSize: _size.width / 26,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 4.0,
                    ),
                    _buildActionChat(
                      context,
                      Feather.settings,
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    _buildActionChat(
                      context,
                      Feather.clock,
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    _buildActionChat(
                      context,
                      Feather.lock,
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    _buildActionChat(
                      context,
                      Feather.pie_chart,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 4.0,
                    ),
                    _buildActionCall(
                      context,
                      Feather.video,
                      Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    _buildActionCall(
                      context,
                      Feather.message_square,
                      Colors.deepPurple.shade700,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: ThemeProvider.of(context).brightness == Brightness.dark
                      ? Colors.white.withOpacity(.04)
                      : Color(0xFFABBAD5),
                  spreadRadius: .8,
                  blurRadius: 2.0,
                  offset: Offset(0, 2.0), // changes position of shadow
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

Widget _buildActionChat(context, icon) {
  return Expanded(
    child: Container(
      height: 45.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          4.0,
        ),
        boxShadow: [
          BoxShadow(
            color: ThemeProvider.of(context).brightness == Brightness.dark
                ? Colors.white.withOpacity(.04)
                : Color(0xFFABBAD5),
            spreadRadius: 1.15,
            blurRadius: 1.25,
            offset: Offset(0, 2.0), // changes position of shadow
          ),
        ],
      ),
      child: Icon(
        icon,
        color: Colors.grey.shade900,
        size: 18.8,
      ),
    ),
  );
}

Widget _buildActionCall(context, icon, color) {
  return Expanded(
    child: Container(
      height: 45.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          4.0,
        ),
        boxShadow: [
          BoxShadow(
            color: ThemeProvider.of(context).brightness == Brightness.dark
                ? Colors.white.withOpacity(.04)
                : Color(0xFFABBAD5),
            spreadRadius: 1.0,
            blurRadius: 1.25,
            offset: Offset(0, 2.0), // changes position of shadow
          ),
        ],
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20.0,
      ),
    ),
  );
}
