import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeColorData with ChangeNotifier {
  ThemeData app = ThemeData(
    scaffoldBackgroundColor: HexColor("#D9D9D9"),
    fontFamily: GoogleFonts.merriweather().fontFamily,
    //AppBar theme
    appBarTheme: AppBarTheme(
      toolbarHeight: 50,
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
  );

  ThemeData get themeColor {
    // Tema yeşilse "green" temasını, değilse "red" temasını döndürür
    return app;
  }
}
