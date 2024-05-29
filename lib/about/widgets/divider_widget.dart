import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 8,
      color: HexColor("#40241A"),
      thickness: 10,
      endIndent: 10,
      indent: 10,
    );
  }
}