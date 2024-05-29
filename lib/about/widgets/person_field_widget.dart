import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PersonField extends StatelessWidget {
  const PersonField({
    super.key,
    required this.name,
    required this.operationName,
    required this.imageUrl,
    required this.description,
  });
  final String name, operationName, imageUrl, description;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          operationName,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.w700, color: Colors.black87),
        ),
        const SizedBox(height: 30),
        CircleAvatar(radius: 120, backgroundImage: AssetImage(imageUrl)),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: HexColor("#40241A"),
            ),
          ),
        )
      ],
    );
  }
}
