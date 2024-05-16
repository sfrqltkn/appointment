import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/shopping_provider/shopping_state_provider.dart';

class CardBottomSheetWidget extends StatelessWidget {
  const CardBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingProvider = Provider.of<ShoppingStateProvider>(context);
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
          height: kBottomNavigationBarHeight + 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const FittedBox(
                        child: Text("Total"),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        shoppingProvider.totalPrice().toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
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
