import 'dart:io';
import 'package:appointment/utils/enums/pages_key.dart';
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
    this.changePageKey,
    required this.routers,
    required this.titleBottom,
    required this.titleRight,
    required this.decsBottom,
  });
  final String color;
  final String assetsName;
  final String title;
  final String description;
  final IconData iconData;
  final String routers;
  final void Function(PageKeys)? changePageKey;
  final double titleBottom;
  final double titleRight;
  final double decsBottom;

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
      debugPrint('object');
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
          widget.changePageKey?.call(PageKeys.appointmentView);
        } else {
          debugPrint("Null");
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
            right: widget.titleRight,
            bottom: widget.titleBottom,
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
            bottom: widget.decsBottom,
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
