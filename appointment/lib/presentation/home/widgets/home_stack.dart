import 'package:flutter/material.dart';

import '../../../decorations_and_colors/colors/home_page_colors.dart';
import '../../../decorations_and_colors/decorations/login_page_decorations.dart';

class HomeStack extends StatelessWidget {
  const HomeStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Positioned(
            child: Image.asset(
              "assets/images/womenImage.jpg",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 20.0,
          left: 95,
          right: 95,
          height: 40,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: ContainerBoxDecorations.buttonDecoration(),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/appointMake_page");
              },
              child: const Text(
                'Randevu Al',
                style: TextStyle(
                  fontSize: 20,
                  color: HomeColors.buttonFontColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
