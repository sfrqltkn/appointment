import 'package:appointment/data/model/products_model.dart';
import 'package:appointment/products/view/shopping_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../providers/shopping_provider/shopping_state_provider.dart';
import '../bloc/products_cubit.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().productsGet().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _isLoading
          ? const CircularProgressIndicator()
          : BlocBuilder<ProductsCubit, List<Products>>(
              builder: (context, productList) {
                if (productList.isNotEmpty) {
                  return GridView.builder(
                    itemCount: productList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1 / 1.1,
                    ),
                    itemBuilder: (context, index) {
                      var product = productList[index];
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
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "${product.name} ",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: HexColor("#40241A"),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Image.network(
                                product.url,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                textAlign: TextAlign.center,
                                product.description,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 28, 41, 47),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: null,
                                    child: Text(
                                      "${product.price} TL",
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
                                    icon:
                                        const Icon(Icons.shopping_bag_rounded),
                                    onPressed: () {
                                      Provider.of<ShoppingStateProvider>(
                                              context,
                                              listen: false)
                                          .addProduct(product);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const ShoppingCartPage(),
                                        ),
                                      );
                                    },
                                    label: const Text(
                                      "Buy the product",
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center();
                }
              },
            ),
    );
  }
}
