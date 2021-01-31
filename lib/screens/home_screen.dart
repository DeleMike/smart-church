import 'package:flutter/material.dart';

import '../widgets/graphs/offering_graph.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
                child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Card(
                elevation: 2,
                child: OfferingGraph(),
              ),
            ),
            Flexible(
              child: Card(
                elevation: 2,
                child: OfferingGraph(),
              ),
            ),
            Flexible(
              child: Card(
                elevation: 2,
                child: OfferingGraph(),
              ),
            ),
            Flexible(
              child: Card(
                elevation: 2,
                child: OfferingGraph(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
