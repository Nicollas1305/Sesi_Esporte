import 'package:flutter/material.dart';
import 'package:sesi_esporte/views/create_user.dart';
import 'package:sesi_esporte/views/home_page.dart';
import 'package:sesi_esporte/views/login_page.dart';
import 'package:sesi_esporte/views/new_payments.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        //primaryColor: Colors.black,
      ),
      initialRoute: '/home',
      routes: {
        '/login': (context) => const LoginPage(),
        '/createuser': (context) => const CreateUserForm(),
        '/home': (context) => const HomePage(),
        '/newpayment': (context) => const Payments(),
      },
    );
  }
}
