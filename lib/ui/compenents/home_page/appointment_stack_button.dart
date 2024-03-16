import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ApointmentButtonStack extends StatelessWidget {
  const ApointmentButtonStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width: 380,
       height: 380,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Image.asset("assets/images/beautyHome.png")),
          Positioned(
            top: 150,
            right: 40,
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: HexColor("#ffffff"),
                shape: const RoundedRectangleBorder(
                    side: BorderSide(width: 2.0)),
              ),
              child: Text(
                "Get Your\n Appointment",
                style: TextStyle(
                  fontSize: 28,
                  color: HexColor("#000000"),
                  fontWeight: FontWeight.w600,
                  fontFamily: GoogleFonts.oswald().fontFamily,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          ),
          Positioned(
            top: 158,
            right: 55,
            child: Opacity(
              opacity: 0.5,
              child: Icon(
                Icons.ads_click_rounded,
                size: 40,
                color: HexColor("#000000"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}