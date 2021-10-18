import 'package:flutter/material.dart';
import 'package:sesi_esporte/views/create_user.dart';
import 'package:sesi_esporte/views/dark_controller.dart';
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
    return AnimatedBuilder(
        animation: DarkController.instance,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: DarkController.instance.isDarkMode
                  ? Brightness.dark
                  : Brightness.light,
              //scaffoldBackgroundColor: const Color(0xFF063970),
              //primaryColor: Colors.white,
              primarySwatch: Colors.orange,
              hintColor: Colors.black,
            ),
            routes: {
              '/login': (context) => const LoginPage(),
              '/createuser': (context) => const CreateUserForm(),
              '/home': (context) => const HomePage(),
              '/newpayment': (context) => const Payments()
            },
            home: const LoginPage(),
          );
        });
  }
}
