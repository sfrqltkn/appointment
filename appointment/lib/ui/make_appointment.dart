import 'package:appointment/data/entity/products.dart';
import 'package:appointment/decorations_and_colors/colors/home_page_colors.dart';
import 'package:appointment/decorations_and_colors/colors/login_page_colors.dart';
import 'package:appointment/ui/cart.page.dart';
import 'package:appointment/ui/cubit/make_appointmentcubit.dart';
import 'package:appointment/ui/home_page.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApointmentMake extends StatefulWidget {
  const ApointmentMake({super.key});

  @override
  State<ApointmentMake> createState() => _ApoointmentMakeState();
}

class _ApoointmentMakeState extends State<ApointmentMake> {
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<MakeAppoCubit>().productUpload();

    // var collectionProduct = FirebaseFirestore.instance.collection("Products");

    // var f1 = {
    //   "id": "",
    //   "ad": "Tırnak",
    //   "resim": "tırnak.jpg",
    //   "fiyat": 150,
    //   "toplam": "0"
    // };
    // var f2 = {
    //   "id": "",
    //   "ad": "Röfle",
    //   "resim": "röfle.jpg",
    //   "fiyat": 200,
    //   "toplam": "0"
    // };
    // var f3 = {
    //   "id": "",
    //   "ad": "Saç Kesim",
    //   "resim": "sac_kesim.jpg",
    //   "fiyat": 250,
    //   "toplam": "0"
    // };
    // var f4 = {
    //   "id": "",
    //   "ad": "Ağda",
    //   "resim": "agda.jpg",
    //   "fiyat": 300,
    //   "toplam": "0"
    // };
    // var f5 = {
    //   "id": "",
    //   "ad": "Topuz",
    //   "resim": "topuz.jpg",
    //   "fiyat": 150,
    //   "toplam": "0"
    // };
    // var f6 = {
    //   "id": "",
    //   "ad": "Manikür - Pedikür",
    //   "resim": "man_ped.jpg",
    //   "fiyat": 200,
    //   "toplam": "0"
    // };
    // var f7 = {
    //   "id": "",
    //   "ad": "İpek Kirpik",
    //   "resim": "ipek_kirpik.jpg",
    //   "fiyat": 180,
    //   "toplam": "0"
    // };
    // var f8 = {
    //   "id": "",
    //   "ad": "Makyaj",
    //   "resim": "makyaj.jpg",
    //   "fiyat": 200,
    //   "toplam": "0"
    // };
    // var f9 = {
    //   "id": "",
    //   "ad": "Peeling",
    //   "resim": "peeling.jpg",
    //   "fiyat": 100,
    //   "toplam": "0"
    // };
    // var f10 = {
    //   "id": "",
    //   "ad": "Boya",
    //   "resim": "sac_boyama.jpg",
    //   "fiyat": 400,
    //   "toplam": "0"
    // };
    // var f11 = {
    //   "id": "",
    //   "ad": "Kaş",
    //   "resim": "kas.jpg",
    //   "fiyat": 100,
    //   "toplam": "0"
    // };
    // var f12 = {
    //   "id": "",
    //   "ad": "Keratin Bakım",
    //   "resim": "keratin.jpeg",
    //   "fiyat": 600,
    //   "toplam": "0"
    // };
    // var f13 = {
    //   "id": "",
    //   "ad": "Gelin Saçı",
    //   "resim": "gelin_sac.jpg",
    //   "fiyat": 1200,
    //   "toplam": "0"
    // };
    // var f14 = {
    //   "id": "",
    //   "ad": "Maşa Düzleştirici",
    //   "resim": "masa_düzlestirici.jpg",
    //   "fiyat": 100,
    //   "toplam": "0"
    // };
    // collectionProduct.add(f1);
    // collectionProduct.add(f2);
    // collectionProduct.add(f3);
    // collectionProduct.add(f4);
    // collectionProduct.add(f5);
    // collectionProduct.add(f6);
    // collectionProduct.add(f7);
    // collectionProduct.add(f8);
    // collectionProduct.add(f9);
    // collectionProduct.add(f10);
    // collectionProduct.add(f11);
    // collectionProduct.add(f12);
    // collectionProduct.add(f13);
    // collectionProduct.add(f14);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeColors.backgroundColor,
      drawer: const Appbardrawer(),
      appBar: AppBar(
        foregroundColor: HomeColors.appBarColors,
        title: const Padding(
          padding: EdgeInsets.only(left: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Beauty",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.shopping_bag,
                size: 29,
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: BlocBuilder<MakeAppoCubit, List<Products>>(
        //isim olarak ürünler içeriği gelcek ve emit(produckList) dinlenecek
        builder: (context, productList) {
          //doluysa çalış
          if (productList.isNotEmpty) {
            return GridView.builder(
              itemCount: productList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 1 / 1.8),
              itemBuilder: (context, index) {
                var product = productList[index];
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("${product.ad} ",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 28, 41, 47),
                                  fontWeight: FontWeight.bold)),
                        ),
                        Image.asset("resimler/${product.resim}"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${product.fiyat} ₺",
                              style: const TextStyle(
                                  fontSize: 24,
                                  color: Color.fromARGB(255, 28, 41, 47),
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              width: 90,
                              height: 40,
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: MainColors.buttonBoxColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CartPage(product: product)));
                                },
                                child: const Text(
                                  "Sepet",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: HomeColors.buttonFontColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
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
      bottomNavigationBar: NavigationBar(
        height: 70,
        onDestinationSelected: (int index) {
          setState(() {
            if (index == 2) {
              Navigator.pushNamed(context, "/login_page");
            } else if (index == 0) {
              Navigator.pushNamed(context, "/home_page");
            } else {
              currentPageIndex = index;
            }
          });
        },
        indicatorColor: Colors.blueGrey,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavBarIcon(
              iconSize: 25, labelText: 'Ana Sayfa', icon: Icons.home_outlined),
          NavBarIcon(iconSize: 25, labelText: 'Çıkış', icon: Icons.exit_to_app),
        ],
      ),
    );
  }
}
