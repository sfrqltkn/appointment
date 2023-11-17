import 'package:appointment/presentation/home/home_page.dart';
import 'package:appointment/presentation/login/login_page.dart';
import 'package:appointment/presentation/login/sign_up_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth',
      debugShowCheckedModeBanner: false,
      routes: {
        "/login_page": (context) => const LoginPage(),
        "/sign_page": (context) => const SignUpPage(),
        "/home_page": (context) => const HomePage(),
      },
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Montserrat',
            ),
      ),
      home: const LoginPage(),
    );
  }
}
