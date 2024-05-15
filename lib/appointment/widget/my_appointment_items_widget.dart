import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 5,
                color: HexColor("#545454"),
              ),
              left: BorderSide(
                width: 3,
                color: HexColor("#545454"),
              ),
              right: BorderSide(
                width: 3,
                color: HexColor("#545454"),
              ),
              top: BorderSide(
                width: 0.2,
                color: HexColor("#545454"),
              ),
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
