import 'package:flutter/material.dart';

class LogoCircleWidget extends StatelessWidget {
  const LogoCircleWidget({
    super.key,
    required this.imageAssets,
    required this.radius,
  });
  final String imageAssets;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
      child: CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(imageAssets),
      ),
    );
  }
}
