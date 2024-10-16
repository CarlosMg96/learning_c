import 'package:flutter/material.dart';
import 'package:learning_c/modules/auth/login.dart';
import 'package:learning_c/navigation/navigation.dart';
import 'package:learning_c/navigation/profile.dart';
import 'package:learning_c/navigation/home.dart';
import 'package:learning_c/widgets/splash_screen.dart';
import 'package:learning_c/navigation/top.dart';
import 'package:learning_c/navigation/reservation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learning_c/modules/auth/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/menu': (context) => const Navigation(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/home': (context) => const Home(),
        '/profile': (context) => const Profile(),
        '/top': (context) => Top(),
        '/reservaciones': (context) => const Reservaciones(),
      },
    );
  }
}
