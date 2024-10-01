import 'package:flutter/material.dart';
import 'package:learning_c/navigation/profile.dart';
import 'package:learning_c/navigation/home.dart';
import 'package:learning_c/widgets/splash_screen.dart';
import 'package:learning_c/navigation/top.dart';
import 'package:learning_c/navigation/reservation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Home(),
        '/profile': (context) => const Profile(),
        '/top': (context) => Top(),
        '/reservaciones': (context) => Reservaciones(),
      },
    );
  }
}
