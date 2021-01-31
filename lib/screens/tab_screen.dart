import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/actions_screen.dart';

class TabScreen extends StatefulWidget {
  static const routeName = '/tab';

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>> _tabs;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabs = [
      {
        'tab': HomeScreen(),
        'title': 'Home',
      },
      {
        'tab': ActionsScreen() ,
        'title': 'Actions',
      },
      {
        'tab': Container(child:Center(child: Text('Settings'),),) ,
        'title': 'Settings',
      },
    ];
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
      print('Tab Screen: Selected Index: $index');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Church'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        elevation: 7,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.call_to_action_outlined),
            label: 'Actions',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
      body: _tabs[_selectedPageIndex]['tab'],
    );
  }
}
