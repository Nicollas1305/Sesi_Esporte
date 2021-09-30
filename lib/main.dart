import 'package:flutter/material.dart';
import 'package:sesi_esporte/views/create_user.dart';
import 'package:sesi_esporte/views/home_page.dart';
import 'package:sesi_esporte/views/home_screen.dart';
import 'package:sesi_esporte/views/login_page.dart';
import 'package:sesi_esporte/views/payments.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => const LoginPage(),
        '/createuser': (context) => const CreateUserForm(),
        '/home': (context) => const HomePage(),
        /**'/payments': (context) => const HomePage(),*/
      },
    );
  }
}
