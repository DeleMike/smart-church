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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            child: Align(
              child: Text(
                'Actions',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
          Divider(),
          Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Align(
              child: DropdownButton(
                underline: Container(),
                value: _selectedFunction,
                onChanged: (newVal) {
                  setState(() {
                    _selectedFunction = newVal;
                  });
                },
                items: _functionsDropdownMenuItems,
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: FlatButton(
              onPressed: () {},
              child: Text('Manage Pastor', style: Theme.of(context).textTheme.headline1),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: FlatButton(
              onPressed: () {},
              child: Text('Manage Branch', style: Theme.of(context).textTheme.headline1),
            ),
          ),
        ],
      ),
    );
  }
}
