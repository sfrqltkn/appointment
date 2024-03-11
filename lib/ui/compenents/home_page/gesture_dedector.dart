import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class GestureConnection extends StatelessWidget {
  const GestureConnection({
    super.key,
    required this.color,
    required this.assetsName,
    required this.title,
    required this.description,
    required this.iconData,
  });
  final String color;
  final String assetsName;
  final String title;
  final String description;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 20,
                  color: HexColor(color),
                ),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(assetsName),
                radius: 150,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 10,
            child: Container(
              width: 60,
              height: 60,
              color: HexColor("#ffffff"),
              child: Icon(
                iconData,
                size: 50,
                color: HexColor(color),
              ),
            ),
          ),
          Positioned(
            right: 40,
            bottom: -45,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.azeretMono().fontFamily,
              ),
            ),
          ),
          Positioned(
            bottom: -110,
            child: Text(
              description,
              style: TextStyle(
                fontSize: 18,
                fontFamily: GoogleFonts.azeretMono().fontFamily,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
