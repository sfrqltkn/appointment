import 'package:appointment/utils/enums/constant.dart';
import 'package:appointment/utils/enums/pages_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../data/model/products_model.dart';
import '../../home/bloc/page_cubit.dart';
import '../bloc/products_data.dart';

class ProductsContent extends StatefulWidget {
  const ProductsContent({
    super.key,
    required this.product,
  });
  final Products product;

  @override
  State<ProductsContent> createState() => _ProductsContentState();
}

class _ProductsContentState extends State<ProductsContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "${widget.product.name} ",
          style: TextStyle(
            fontSize: 16,
            color: HexColor("#40241A"),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Image.network(
          widget.product.url,
          fit: BoxFit.fill,
        ),
        const SizedBox(height: 20),
        Text(
          textAlign: TextAlign.center,
          widget.product.description,
          style: const TextStyle(
            fontSize: 12,
            color: Color.fromARGB(255, 28, 41, 47),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: null,
              child: Text(
                "${widget.product.price} TL",
                style: const TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(width: 12),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.shopping_bag_rounded),
              onPressed: () {
                addSelectedItems(context, widget.product);
                context.read<PageCubit>().changePageKey(PageKeys.shoppingView);
              },
              label: Text(
                LocaleConstants.buyProductsButton,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
