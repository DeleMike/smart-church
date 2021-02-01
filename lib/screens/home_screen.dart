import 'package:flutter/material.dart';

import '../widgets/graphs/offering_graph.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
                          child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Card(
                      elevation: 2,
                      child: OfferingGraph('Attendance reports'),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      elevation: 2,
                      child: OfferingGraph('Income reports'),
                    ),
                  ),
                  Flexible(
                    child: Card(
                      elevation: 2,
                      child: OfferingGraph('Expense reports'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FlatButton(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('View All Reports', style: Theme.of(context).textTheme.headline1.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w600,
              ),),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
