import 'package:flutter/material.dart';

class ActionsScreen extends StatefulWidget {
  @override
  _ActionsScreenState createState() => _ActionsScreenState();
}

class _ActionsScreenState extends State<ActionsScreen> {
  static const _functions = [
    'Create offering type',
    'Create new expense',
    'Create new branch',
    'Add new pastor'
  ];

  String _selectedFunction = 'Create offering type';

  final List<DropdownMenuItem<String>> _functionsDropdownMenuItems =
      _functions.map((val) {
    return DropdownMenuItem<String>(value: val, child: Text(val));
  }).toList();

  Widget _buildActionWidget(String action, Function func) {
    return InkWell(
      onTap: func,
      splashColor: Colors.black26,
      highlightColor: Colors.indigo[100],
      child: Container(
        margin: EdgeInsets.all(16.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                action,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            Icon(
              Icons.arrow_right,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildActionWidget('Visit branch', () {
            print('visit branch');
          }),
          _buildActionWidget('New offering title', () {}),
          _buildActionWidget('New Expense', () {}),
          _buildActionWidget('New Branch', () {}),
          _buildActionWidget('New add new pastor', () {}),
          _buildActionWidget('Manage Pastor', () {}),
          _buildActionWidget('Manage Branch', () {}),
        ],
      ),
    );
  }
}
