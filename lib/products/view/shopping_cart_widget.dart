import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/products_model.dart';
import '../../providers/shopping_provider/shopping_state_provider.dart';
import '../widgets/heart_button.dart';
import '../widgets/quantity_btm_widget.dart';

class ShoppingCartWidget extends StatelessWidget {
  const ShoppingCartWidget({super.key, required this.product});

  final Products product;

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
                    product.url,
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
                            width: size.width * 0.8,
                            child: Text(product.name),
                          ),
                          Column(
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Provider.of<ShoppingStateProvider>(context,
                                  //         listen: false)
                                  //     .removeOneItem(
                                  //         index: shoppingProvider
                                  //             .indexOf(product));
                                },
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                ),
                              ),
                              const HeartButtonWidget(),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text("${product.price} \$",
                              style: const TextStyle(color: Colors.blue)),
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
                                  return const QuantityBottomSheetWidget();
                                },
                              );
                            },
                            icon: const Icon(CupertinoIcons.chevron_down),
                            label: Text(
                                Provider.of<ShoppingStateProvider>(context)
                                    .productCount
                                    .toString()),
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(width: 1),
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
}
