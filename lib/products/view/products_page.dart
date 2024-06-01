import 'package:appointment/products/bloc/products_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/products_cubit.dart';
import '../widgets/products_content_widget.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocProvider(
        create: (context) => ProductsCubit()..getProducts(),
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, productList) {
            if (productList.data!.isEmpty) {
              return const CircularProgressIndicator();
            }
            return GridView.builder(
              itemCount: productList.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                childAspectRatio: 1 / 1.2,
              ),
              itemBuilder: (context, index) {
                var product = productList.data![index];
                return Card(
                  shape: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(45.0),
                    ),
                    borderSide: BorderSide(
                      width: 5,
                      color: Colors.brown,
                    ),
                  ),
                  margin: const EdgeInsets.only(
                      bottom: 30, left: 25, right: 25, top: 20),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ProductsContent(product: product),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
