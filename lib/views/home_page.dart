import 'package:flutter/material.dart';
import 'package:sesi_esporte/views/historic.dart';
import 'package:sesi_esporte/views/create_payments.dart';
import 'package:sesi_esporte/views/new_payments.dart';
import 'package:sesi_esporte/views/payment_page.dart';
import 'package:sesi_esporte/views/settings.dart';

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
      const Center(child: Historic()),
      const Center(child: PaymentPage()),
      const Center(
          child: Settings(
        email: 'Nicollas',
      )),
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
