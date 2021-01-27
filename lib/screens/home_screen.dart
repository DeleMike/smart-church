import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, Object>> _tabs;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabs = [
      {
        'tab': Container(child:Center(child: Text('Church activity displayed here, Real time?'),),) ,
        'title': 'Home',
      },
      {
        'tab': Container(child:Center(child: Text('Pastor actions'),),) ,
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
      print('Home Screen: Selected Index: $index');
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
