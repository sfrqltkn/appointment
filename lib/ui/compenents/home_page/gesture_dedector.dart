import 'dart:io';

import 'package:appointment/ui/screens/make_appointment_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

class GestureConnection extends StatefulWidget {
  const GestureConnection({
    super.key,
    required this.color,
    required this.assetsName,
    required this.title,
    required this.description,
    required this.iconData,
    required this.routers,
  });
  final String color;
  final String assetsName;
  final String title;
  final String description;
  final IconData iconData;
  final String routers;

  @override
  State<GestureConnection> createState() => _GestureConnectionState();
}

class _GestureConnectionState extends State<GestureConnection> {
  Uri dialnumber = Uri(scheme: 'tel', path: '0 312 258 45 58');

  callNumber() async {
    await launchUrl(dialnumber);
  }

  whatsapp() async {
    String contact = "905076262183";
    String text = '';
    String androidUrl = "whatsapp://send?phone=$contact&text=$text";
    String iosUrl = "https://wa.me/$contact?text=${Uri.parse(text)}";

    String webUrl = 'https://api.whatsapp.com/send/?phone=$contact&text=hi';

    try {
      if (Platform.isIOS) {
        if (await canLaunchUrl(Uri.parse(iosUrl))) {
          await launchUrl(Uri.parse(iosUrl));
        }
      } else {
        if (await canLaunchUrl(Uri.parse(androidUrl))) {
          await launchUrl(Uri.parse(androidUrl));
        }
      }
    } catch (e) {
      print('object');
      await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.routers == "whatsapp") {
          whatsapp();
        } else if (widget.routers == "call") {
          callNumber();
        } else if (widget.routers == "appointment") {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MakeAppointment()),
          );
        } else {
          print("Null");
        }
      },
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
                  color: HexColor(widget.color),
                ),
              ),
              child: CircleAvatar(
                backgroundImage: AssetImage(widget.assetsName),
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
                widget.iconData,
                size: 50,
                color: HexColor(widget.color),
              ),
            ),
          ),
          Positioned(
            right: 40,
            bottom: -45,
            child: Text(
              widget.title,
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
              widget.description,
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
