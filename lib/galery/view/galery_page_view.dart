import 'package:appointment/data/model/galery_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class GaleryView extends StatelessWidget {
  final Galery galery;
  final int index;
  GaleryView({super.key, required this.galery, required this.index});

  final List<String> titleCoursel = [
    "Eyelash & Nail\n      Eyebrow",
    "Our Hair Designs",
    " Make Up & Facial care\n             Wax",
    "Beauty Products"
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            titleCoursel[index],
            style: TextStyle(
              fontSize: 32,
              fontFamily: GoogleFonts.nunitoSans().fontFamily,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              color: HexColor("#494949"),
            ),
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 400,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            enlargeCenterPage: true,
          ),
          items: [
            Image.network(
              galery.url1,
              fit: BoxFit.cover,
            ),
            Image.network(
              galery.url2,
              fit: BoxFit.cover,
            ),
            Image.network(
              galery.url3,
              fit: BoxFit.cover,
            ),
            Image.network(
              galery.url4,
              fit: BoxFit.cover,
            ),
            Image.network(
              galery.url5,
              fit: BoxFit.cover,
            ),
            Image.network(
              galery.url6,
              fit: BoxFit.cover,
            ),
          ],
        ),
        const SizedBox(height: 40),
        Divider(
          height: 10,
          color: HexColor("#40241A"),
          thickness: 8,
          endIndent: 25,
          indent: 25,
        ),
        const SizedBox(height: 85),
      ],
    );
  }
}
