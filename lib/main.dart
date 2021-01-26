import 'package:flutter/material.dart';

import './screens/auth_screen.dart';
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
      debugShowCheckedModeBanner: false,
    );
  }
}