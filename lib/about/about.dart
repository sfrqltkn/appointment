import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Text("About Page"),
      ),
    );
  }
}
