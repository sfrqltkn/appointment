import 'package:appointment/utils/enums/pages_key.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class StackGaleryView extends StatelessWidget {
  final void Function(PageKeys) changePageKey;
  const StackGaleryView({
    super.key,
    required this.changePageKey,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Positioned(
          child: Image.asset("assets/images/galeryView2.png"),
        ),
        Positioned(
          bottom: 60,
          child: ElevatedButton(
            onPressed: () {
              changePageKey(PageKeys.galleryView);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: HexColor("#4B4848"),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              foregroundColor: HexColor("#ffffff"),
            ),
            child: Text(
              " Gallery View ",
              style: TextStyle(
                fontSize: 30,
                fontFamily: GoogleFonts.azeretMono().fontFamily,
                fontWeight: FontWeight.w500,
                letterSpacing: 2.2,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
