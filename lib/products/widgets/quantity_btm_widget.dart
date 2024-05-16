import 'package:appointment/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/shopping_provider/shopping_state_provider.dart';

class QuantityBottomSheetWidget extends StatefulWidget {
  const QuantityBottomSheetWidget({super.key, required this.products});
  final Products products;

  @override
  State<QuantityBottomSheetWidget> createState() =>
      _QuantityBottomSheetWidgetState();
}

class _QuantityBottomSheetWidgetState extends State<QuantityBottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  chanceItemsCount(index + 1, widget.products);
                  Navigator.pop(context);
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text("${index + 1}"),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void chanceItemsCount(int count, Products products) {
    final shoppingProvider =
        Provider.of<ShoppingStateProvider>(context, listen: false);

    if (products.price == 550) {
      shoppingProvider.shoppingCareCreamItems.clear();

      shoppingProvider.shoppingCareCreamItems
          .addAll(List.generate(count, (index) => products));
      shoppingProvider
          .changecareCount(shoppingProvider.shoppingCareCreamItems.length);
    } else if (products.price == 450) {
      shoppingProvider.shoppingIntensiveItems.clear();

      shoppingProvider.shoppingIntensiveItems
          .addAll(List.generate(count, (index) => products));
      shoppingProvider
          .changeintensiveCount(shoppingProvider.shoppingIntensiveItems.length);
    } else {
      shoppingProvider.shoppingHerbalItems.clear();

      shoppingProvider.shoppingHerbalItems
          .addAll(List.generate(count, (index) => products));

      shoppingProvider
          .changeherbalCount(shoppingProvider.shoppingHerbalItems.length);
    }
  }
}
