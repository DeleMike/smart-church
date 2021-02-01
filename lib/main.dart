import 'package:flutter/material.dart';

import './screens/auth_screen.dart';
import './screens/home_screen.dart';
import './screens/tab_screen.dart';
import './screens/settings_screen.dart';
import './helpers/styles.dart';

void main() {
  runApp(SmartChurchApp());
}

class SmartChurchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Church',
      theme:  Styles.themeData(false, context),
      home: AuthScreen(),
      routes: {
        TabScreen.routeName: (ctx) => TabScreen(),
        HomeScreen.routeName : (ctx) => HomeScreen(),
        SettingsScreen.routeName : (ctx) => SettingsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}