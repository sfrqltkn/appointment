import 'package:appointment/utils/enums/pages_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../home/bloc/page_cubit.dart';

class EmptyBagWidget extends StatelessWidget {
  const EmptyBagWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.buttonText,
  });

  final String imagePath, title, buttonText;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            imagePath,
            width: double.infinity,
            height: size.height * 0.35,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "",
            style: TextStyle(fontSize: 40, color: Colors.red),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 25),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: const RoundedRectangleBorder(
                  side: BorderSide.none,
                ),
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              onPressed: () {
                context.read<PageCubit>().changePageKey(PageKeys.productsView);
              },
              child: Text(buttonText)),
        ],
      ),
    );
  }
}
