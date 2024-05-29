import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ProfileVisibility extends StatelessWidget {
  const ProfileVisibility({
    super.key,
    required this.isSelectPerson,
    required this.selectedPersonProfileUrl,
    required this.size,
  });

  final bool isSelectPerson;
  final String selectedPersonProfileUrl;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
        visible: isSelectPerson,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 5,
              color: HexColor("#40241A"),
            ),
            image: DecorationImage(
              image: NetworkImage(selectedPersonProfileUrl),
              fit: BoxFit.fill,
            ),
            shape: BoxShape.circle,
          ),
          width: size.width * 0.55,
          height: size.width * 0.55,
        ),
      ),
    );
  }
}
