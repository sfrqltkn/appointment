import 'package:appointment/ui/screens/login_page.dart';
import 'package:appointment/ui/screens/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => const LoginPage(),
        SignUpPage.routeName: (context) => const SignUpPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: HexColor("#D9D9D9"),
        fontFamily: GoogleFonts.merriweather().fontFamily,
        //AppBar theme
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: HexColor("#A29B9B"),
          titleTextStyle: TextStyle(
            color: HexColor("#602E17"),
            fontSize: 36,
            fontWeight: FontWeight.w900,
            fontFamily: GoogleFonts.merriweather().fontFamily,
            letterSpacing: 1.5,
          ),
        ),

        //ElevatedButton theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(HexColor("#545454")),
            foregroundColor: MaterialStatePropertyAll(HexColor("#FFFFFF")),
          ),
        ),

        //Drawer
        drawerTheme: DrawerThemeData(
          width: 310,
          backgroundColor: HexColor("#6D412D"),
        ),
        listTileTheme: ListTileThemeData(
          textColor: HexColor("#D9D9D9"),
          iconColor: HexColor("#D9D9D9"),
          titleTextStyle: TextStyle(
            fontSize: 18,
            inherit: false,
            fontFamily: GoogleFonts.merriweather().fontFamily,
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
    );
  }
}
