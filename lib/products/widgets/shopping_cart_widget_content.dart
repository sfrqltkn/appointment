import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../data/model/products_model.dart';
import '../widgets/quantity_btm_widget.dart';

class ShoppingCartWidgetContent extends StatelessWidget {
  const ShoppingCartWidgetContent(
      {super.key,
      required this.product,
      required this.clearProducts,
      required this.countItems});

  final Products product;
  final void Function(int price, BuildContext context) clearProducts;
  final String Function(int price, BuildContext context) countItems;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return IntrinsicWidth(
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
                        width: size.width * 0.9,
                        child: Text(
                          product.name,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              clearProducts(product.price, context);
                            },
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
                          "${product.price} TL",
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
                                  products: product);
                            },
                          );
                        },
                        icon: const Icon(CupertinoIcons.chevron_down, size: 25),
                        label: Text(
                          countItems(product.price, context),
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
            ),
          ],
        ),
      ),
    );
  }
}
