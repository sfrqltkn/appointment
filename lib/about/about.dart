import 'package:appointment/about/widgets/divider_widget.dart';
import 'package:appointment/about/widgets/person_field_widget.dart';
import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(child: Image.asset("assets/images/aboutPage.png")),
              Positioned(
                top: 150,
                left: 70,
                child: Text(
                  LocaleConstants.pageImageTitle,
                  style: TextStyle(
                    fontSize: 25,
                    color: HexColor("#f7e7e7"),
                    fontWeight: FontWeight.w600,
                    fontFamily: GoogleFonts.oswald().fontFamily,
                    letterSpacing: 1.8,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Text(
            LocaleConstants.pageTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: HexColor("737373"),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            LocaleConstants.pageDesc,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: HexColor("#40241A"),
            ),
          ),
          const SizedBox(height: 80),
          const DividerWidget(),
          const SizedBox(height: 10),
          PersonField(
              name: "Humeyra",
              operationName: "(${LocaleConstants.humeyraField})",
              imageUrl: "assets/images/Arife.avif",
              description: LocaleConstants.humeyraDescriptiom),
          const SizedBox(height: 80),
          const DividerWidget(),
          const SizedBox(height: 10),
          PersonField(
              name: "Asal",
              operationName: "(${LocaleConstants.asalField})",
              imageUrl: "assets/images/Asal.avif",
              description: LocaleConstants.asalDescriptiom),
          const SizedBox(height: 50),
          const DividerWidget(),
          const SizedBox(height: 10),
          PersonField(
              name: "Arife",
              operationName: "(${LocaleConstants.arifeField})",
              imageUrl: "assets/images/Arife.avif",
              description: LocaleConstants.arifeDescriptiom),
          const SizedBox(height: 80),
          const DividerWidget(),
          const SizedBox(height: 10),
          PersonField(
              name: "Çağrı",
              operationName: "(${LocaleConstants.cagriField})",
              imageUrl: "assets/images/Cagri.avif",
              description: LocaleConstants.cagriDescriptiom),
          const SizedBox(height: 80),
          const DividerWidget(),
          const SizedBox(height: 10),
          PersonField(
              name: "Kubilay",
              operationName: "(${LocaleConstants.kubilayField})",
              imageUrl: "assets/images/Kubilay.avif",
              description: LocaleConstants.kubilayDescriptiom),
        ],
      ),
    );
  }
}
