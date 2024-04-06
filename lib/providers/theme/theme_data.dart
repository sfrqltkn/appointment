import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeColorData with ChangeNotifier {
  ThemeData app = ThemeData(
    scaffoldBackgroundColor: HexColor("#D9D9D9"),
    fontFamily: GoogleFonts.merriweather().fontFamily,
    //AppBar theme
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: HexColor("#40241A"),
        size: 35,
      ),
      toolbarHeight: 50,
      centerTitle: true,
      backgroundColor: HexColor("#A29B9B"),
      titleTextStyle: TextStyle(
        color: HexColor("#40241A"),
        fontSize: 38,
        fontWeight: FontWeight.w900,
        fontFamily: GoogleFonts.merriweather().fontFamily,
        letterSpacing: 1.5,
      ),
    ),
    //ElevatedButton theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(HexColor("#545454")),
        foregroundColor: WidgetStatePropertyAll(HexColor("#FFFFFF")),
      ),
    ),

    //Drawer
    navigationDrawerTheme: NavigationDrawerThemeData(
      indicatorColor: HexColor("#A29B9B"),
      backgroundColor: HexColor("#6D412D"),
      iconTheme: WidgetStatePropertyAll(
        IconThemeData(
          color: HexColor("#A29B9B"),
          size: 25,
        ),
      ),
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(
          color: HexColor("#A29B9B"),
          fontFamily: GoogleFonts.merriweather().fontFamily,
          inherit: false,
          fontWeight: FontWeight.w800,
          fontSize: 18,
          letterSpacing: 1.1,
        ),
      ),
    ),

    //NavigationBar
    navigationBarTheme: NavigationBarThemeData(
      indicatorColor: HexColor("#40241A"),
      labelTextStyle: WidgetStatePropertyAll(
        TextStyle(color: HexColor("#40241A"), fontSize: 11),
      ),
      backgroundColor: HexColor("#A29B9B"),
      iconTheme: WidgetStatePropertyAll(
        IconThemeData(
          color: HexColor("#40241A"),
          size: 30,
        ),
      ),
    ),
  );

  ThemeData get themeColor {
    return app;
  }
}
