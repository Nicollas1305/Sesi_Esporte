import 'package:flutter/material.dart';

import 'home_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      const Center(child: HomeScreen()),
      const Center(child: Icon(Icons.history, size: 64.0, color: Colors.cyan)),
      const Center(
          child: Icon(Icons.payments_outlined, size: 64.0, color: Colors.blue)),
      const Center(
          child: Icon(Icons.settings_sharp, size: 64.0, color: Colors.blue)),
    ];
    final _kBottmonNavBarItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Principal'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.history), label: 'Histórico'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.payments_outlined), label: 'Pagamentos'),
      const BottomNavigationBarItem(
          icon: Icon(Icons.settings_sharp), label: 'Configurações'),
    ];

    final bottomNavBar = BottomNavigationBar(
      items: _kBottmonNavBarItems,
      currentIndex: _currentTabIndex,
      fixedColor: Colors.orange,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentTabIndex = index;
        });
      },
    );
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Center(child: Text('Sesi Esporte')),
        ),
        body: _kTabPages[_currentTabIndex],
        bottomNavigationBar: bottomNavBar,
      ),
    );
  }
}
