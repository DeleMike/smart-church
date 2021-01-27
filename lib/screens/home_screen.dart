import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Church'),
      ),
      body: Center(
        child: Text('Church activity displayed here, Real time?'),
      ),
    );
  }
}
