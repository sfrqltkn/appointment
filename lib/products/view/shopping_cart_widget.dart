import 'package:flutter/material.dart';
import '../../data/model/products_model.dart';
import '../bloc/products_data.dart';
import '../widgets/shopping_cart_widget_content.dart';

class ShoppingCartWidget extends StatefulWidget {
  const ShoppingCartWidget({super.key, required this.product});

  final Products product;

  @override
  State<ShoppingCartWidget> createState() => _ShoppingCartWidgetState();
}

class _ShoppingCartWidgetState extends State<ShoppingCartWidget> {

  @override
  Widget build(BuildContext context) {
    return Card(
      child: FittedBox(
        child: ShoppingCartWidgetContent(
          product: widget.product,
          clearProducts: clearProducts,
          countItems: countItems,
        ),
      ),
    );
  }
}
