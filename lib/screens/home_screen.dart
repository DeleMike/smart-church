import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Card(
                elevation: 4,
                child: Container(
                  height: 100,
                ),
              ),
            ),
            Flexible(
               child: Card(
                elevation: 4,
                child: Container(
                  height: 100,
                ),
              ),
            ),
            Flexible(
               child: Card(
                elevation: 4,
                child: Container(
                  height: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
