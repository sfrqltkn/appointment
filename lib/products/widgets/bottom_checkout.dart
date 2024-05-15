import 'package:flutter/material.dart';

class CardBottomSheetWidget extends StatelessWidget {
  const CardBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: const Border(
          top: BorderSide(width: 1, color: Colors.red),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: kBottomNavigationBarHeight + 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text("Total(6 Product/ 9 Items)"),
                    ),
                    Text("\$ 16.0", style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Checkout")),
            ],
          ),
        ),
      ),
    );
  }
}
