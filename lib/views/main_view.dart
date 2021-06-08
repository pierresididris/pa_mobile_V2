import 'package:flutter/material.dart';
import 'package:pa_fjt_mobile/views/dashboard_page.dart';
import 'package:pa_fjt_mobile/views/request_page.dart';

class MainView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView> {
  int _selectedTab = 0;
  final List<Widget> _widgetOptions = <Widget>[];

  @override
  void initState() {
    _widgetOptions.add(
      DashboardPage(
        switchTabRequest: updateTab,
      ),
    );
    _widgetOptions.add(RequestsPage());
    super.initState();
  }

  void updateTab(int tab) {
    setState(() {
      _selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedTab),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.request_page),
            label: 'Requests',
          ),
        ],
        currentIndex: _selectedTab,
        selectedItemColor: Colors.amber[800],
        onTap: updateTab,
      ),
    );
  }
}
