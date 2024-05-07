import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MyAppointmentText extends StatelessWidget {
  const MyAppointmentText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, top: 15),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: HexColor("#545454"),
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
