import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: ThemeProvider.of(context).brightness,
      ),
      body: Container(),
    );
  }
}
