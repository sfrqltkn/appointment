import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';


class MyAppointmentItems extends StatelessWidget {
  const MyAppointmentItems({
    super.key,
    required this.size,
    required this.itemsContent,
  });

  final Size size;
  final String itemsContent;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              width: 5,
              color: HexColor("#545454"),
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          width: size.width * 0.70,
          child: Center(
            child: Text(
              itemsContent,
              style: TextStyle(color: HexColor("#545454"), fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
