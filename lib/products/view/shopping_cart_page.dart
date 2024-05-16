import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/shopping_provider/shopping_state_provider.dart';
import '../widgets/bottom_checkout.dart';
import 'shopping_cart_widget.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    final shoppingProvider = Provider.of<ShoppingStateProvider>(context);

    return Scaffold(
      bottomSheet: const CardBottomSheetWidget(),
      body: shoppingProvider.shoppingItems.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: shoppingProvider.shoppingItems.length,
                    itemBuilder: (context, index) {
                      return ShoppingCartWidget(
                        product: shoppingProvider.shoppingItems[index],
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
