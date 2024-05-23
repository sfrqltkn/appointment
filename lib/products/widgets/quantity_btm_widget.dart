import 'package:appointment/data/model/products_model.dart';
import 'package:flutter/material.dart';
import '../bloc/products_data.dart';

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
            itemCount: 9,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  chanceItemsCount(index + 1, widget.products, context);
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
}
