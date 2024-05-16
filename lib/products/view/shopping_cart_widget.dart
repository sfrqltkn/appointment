import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/model/products_model.dart';
import '../../providers/shopping_provider/shopping_state_provider.dart';
import '../widgets/quantity_btm_widget.dart';

class ShoppingCartWidget extends StatefulWidget {
  const ShoppingCartWidget({super.key, required this.product});

  final Products product;

  @override
  State<ShoppingCartWidget> createState() => _ShoppingCartWidgetState();
}

class _ShoppingCartWidgetState extends State<ShoppingCartWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: FittedBox(
        child: IntrinsicWidth(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image.network(
                    widget.product.url,
                    height: size.height * 0.2,
                    width: size.height * 0.3,
                  ),
                ),
                const SizedBox(width: 10),
                IntrinsicWidth(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.9,
                            child: Text(
                              widget.product.name,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.clear,
                                  size: 40,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: null,
                            child: Text(
                              "${widget.product.price} TL",
                              style: const TextStyle(fontSize: 18),
                            ),
                          ),
                          const Spacer(),
                          OutlinedButton.icon(
                            onPressed: () async {
                              await showModalBottomSheet(
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                ),
                                context: context,
                                builder: (context) {
                                  return QuantityBottomSheetWidget(
                                      products: widget.product);
                                },
                              );
                              setState(() {});
                            },
                            icon: const Icon(CupertinoIcons.chevron_down,
                                size: 25),
                            label: Text(
                              countItems(widget.product.price, context),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(width: 2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String countItems(int itemsPrice, context) {
    final shoppingProvider = Provider.of<ShoppingStateProvider>(context);
    if (itemsPrice == 550) {
      shoppingProvider
          .changecareCount(shoppingProvider.shoppingCareCreamItems.length);
      // debugPrint(shoppingProvider.shoppingCareCreamItems.length.toString());
      return shoppingProvider.careCount.toString();
    } else if (itemsPrice == 250) {
      shoppingProvider
          .changeherbalCount(shoppingProvider.shoppingHerbalItems.length);
      // debugPrint(shoppingProvider.shoppingHerbalItems.length.toString());
      return shoppingProvider.herbalCount.toString();
    } else if (itemsPrice == 450) {
      shoppingProvider
          .changeintensiveCount(shoppingProvider.shoppingIntensiveItems.length);
      // debugPrint(shoppingProvider.shoppingHerbalItems.length.toString());
      return shoppingProvider.intensiveCount.toString();
    } else {
      return "";
    }
  }
}
