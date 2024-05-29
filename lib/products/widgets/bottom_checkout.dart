import 'package:appointment/home/bloc/page_cubit.dart';
import 'package:appointment/utils/enums/constant.dart';
import 'package:appointment/utils/enums/pages_key.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../providers/shopping_provider/shopping_state_provider.dart';
import '../bloc/products_data.dart';

class CardBottomSheetWidget extends StatelessWidget {
  const CardBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final shoppingProvider = Provider.of<ShoppingStateProvider>(context);
    bool disable = shoppingProvider.isCheckOutState();
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border(
          top: BorderSide(
            width: 2,
            color: HexColor("#6D412D"),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SizedBox(
          height: kBottomNavigationBarHeight + 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  FittedBox(
                    child: Text(
                      LocaleConstants.totalPrice,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#6D412D"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${shoppingProvider.totalPrice().toString()} TL",
                    style: TextStyle(
                      color: HexColor("#333333"),
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: disable ? Colors.brown : null,
                  foregroundColor: disable ? Colors.white : null,
                ),
                onPressed: () {
                  if (disable == false) {
                    null;
                  } else if (disable == true) {
                    cartStateAfterPay(context);
                    context
                        .read<PageCubit>()
                        .changePageKey(PageKeys.paymentView);
                  }
                },
                child: Text(
                  LocaleConstants.buyButton,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
