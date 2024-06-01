import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/enums/pages_key.dart';
import '../bloc/page_cubit.dart';

class BuyProductsButtonStack extends StatelessWidget {
  final void Function(PageKeys) changePageKey;
  const BuyProductsButtonStack({
    super.key,
    required this.changePageKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 15,
          color: HexColor("#424242"),
        ),
        borderRadius: BorderRadius.circular(1.0),
      ),
      child: SizedBox(
        width: 380,
        height: 380,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(child: Image.asset("assets/images/buy_products.png")),
            Positioned(
              top: 20,
              right: 50,
              child: Text(
                LocaleConstants.naturalText,
                style: TextStyle(
                  fontSize: 40,
                  color: HexColor("#7C594A"),
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.marckScript().fontFamily,
                  letterSpacing: 3,
                ),
              ),
            ),
            Positioned(
              top: 210,
              right: 30,
              child: TextButton(
                onPressed: () {
                  context
                      .read<PageCubit>()
                      .changePageKey(PageKeys.productsView);
                },
                child: Text(
                  LocaleConstants.buyNow,
                  style: TextStyle(
                    fontSize: 25,
                    color: HexColor("#40241A"),
                    fontWeight: FontWeight.w500,
                    fontFamily: GoogleFonts.oswald().fontFamily,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
