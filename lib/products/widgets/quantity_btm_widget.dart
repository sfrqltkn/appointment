import 'package:flutter/material.dart';

class QuantityBottomSheetWidget extends StatefulWidget {
  const QuantityBottomSheetWidget({super.key});

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
                  // setState(() {
                  //   Provider.of<ShoppingStateProvider>(context, listen: false)
                  //       .changeproductCount(index + 1);
                  // });
                  // Navigator.pop(context);
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
