import 'package:appointment/products/bloc/products_cubit.dart';
import 'package:appointment/products/bloc/products_state.dart';
import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/enums/pages_key.dart';
import '../bloc/page_cubit.dart';

class ProductsInfo extends StatelessWidget {
  const ProductsInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return SizedBox(
          width: 380,
          height: 380,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(child: Image.asset("assets/images/beautyHome.png")),
              Positioned(
                top: 150,
                right: 40,
                child: TextButton(
                  onPressed: () {
                    context
                        .read<PageCubit>()
                        .changePageKey(PageKeys.productsView);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: HexColor("#ffffff"),
                    shape: const RoundedRectangleBorder(
                        side: BorderSide(width: 2.0)),
                  ),
                  child: Text(
                    LocaleConstants.getAppointment,
                    style: TextStyle(
                      fontSize: 25,
                      color: HexColor("#000000"),
                      fontWeight: FontWeight.w600,
                      fontFamily: GoogleFonts.oswald().fontFamily,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 162,
                right: 43,
                child: Opacity(
                  opacity: 0.5,
                  child: Icon(
                    Icons.ads_click_rounded,
                    size: 30,
                    color: HexColor("#000000"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
