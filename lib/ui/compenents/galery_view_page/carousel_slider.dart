import 'package:appointment/ui/compenents/galery_view_page/slider_image_data.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SliderImage extends StatefulWidget {
  const SliderImage({
    super.key,
    required this.imageName,
  });
  final String imageName;

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  ImageData image = ImageData();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: CarouselSlider.builder(
            options: CarouselOptions(
              height: 400,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enlargeCenterPage: true,
            ),
            itemCount: image.listLengthSelector(widget.imageName),
            itemBuilder: (context, index, realIndex) {
              final urlImage = image.listSelector(widget.imageName)[index];
              return buildImage(urlImage, index);
            },
          ),
        ),
        const SizedBox(height: 10),
        Divider(
          height: 10,
          color: HexColor("#40241A"),
          thickness: 8,
          endIndent: 25,
          indent: 25,
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}

class SliderText extends StatefulWidget {
  const SliderText({
    super.key,
    required this.textName,
  });
  final String textName;

  @override
  State<SliderText> createState() => _SliderTextState();
}

class _SliderTextState extends State<SliderText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        widget.textName,
        style: TextStyle(
          fontSize: 32,
          fontFamily: GoogleFonts.nunitoSans().fontFamily,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          color: HexColor("#494949"),
        ),
      ),
    );
  }
}
