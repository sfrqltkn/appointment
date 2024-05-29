import 'package:flutter/material.dart';

class ChooseDateButton extends StatelessWidget {
  const ChooseDateButton(
      {super.key,
      required this.width,
      required this.title,
      required this.onPressed,
      required this.disable});

  final double width;
  final String title;
  final bool disable; //this is used to disable button
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          backgroundColor: Colors.brown,
          foregroundColor: Colors.white,
        ),
        onPressed: disable ? null : onPressed,
        child: Text(
          title,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}
