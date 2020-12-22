import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whoru_mobile/src/models/user.dart';
import 'package:whoru_mobile/src/pages/auth/auth_page.dart';
import 'package:whoru_mobile/src/pages/navigation/navigation.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return user == null ? AuthenticatePage() : Navigation();
  }
}
