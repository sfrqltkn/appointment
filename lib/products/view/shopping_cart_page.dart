import 'package:appointment/home/bloc/page_cubit.dart';
import 'package:appointment/utils/enums/constant.dart';
import 'package:appointment/utils/enums/pages_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../providers/shopping_provider/shopping_state_provider.dart';
import '../widgets/bottom_checkout.dart';
import '../widgets/empty_bag_widget.dart';
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
          ? EmptyBagWidget(
              imagePath: "assets/images/woman.png",
              title: LocaleConstants.emptyCart,
              buttonText: LocaleConstants.emptyCartButton)
          : Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    itemCount: shoppingProvider.shoppingItems.length,
                    itemBuilder: (context, index) {
                      return ShoppingCartWidget(
                        product: shoppingProvider.shoppingItems[index],
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      context
                          .read<PageCubit>()
                          .changePageKey(PageKeys.productsView);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: HexColor("#6D412D"),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          LocaleConstants.keepAddCart,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: HexColor("#6D412D"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 60),
              ],
            ),
    );
  }
}
