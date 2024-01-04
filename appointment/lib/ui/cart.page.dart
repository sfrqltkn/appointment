import 'package:appointment/data/entity/products.dart';
import 'package:appointment/decorations_and_colors/colors/home_page_colors.dart';
import 'package:appointment/decorations_and_colors/colors/login_page_colors.dart';
import 'package:appointment/ui/home_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  final Products product;
  CartPage({required this.product});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int currentPageIndex = 0;
  int _productCount = 1;
  late final int _initialValue;

  @override
  void initState() {
    super.initState();
    _initialValue = widget.product.fiyat;
  }

  void _updateProductCount(int delta) {
    setState(() {
      _productCount += delta;
    });
  }

  void _incrementProductCount() {
    _updateProductCount(1);
  }

  void _decrementProductCount() {
    if (_productCount > 0) {
      _updateProductCount(-1);
    }
  }

  int get _changeCount => _productCount * _initialValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                shadows: [Shadow( 
                  
                )],
              ),
            ],
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset("resimler/${widget.product.resim}"),
          Text(
            "₺${widget.product.fiyat.toString()}",
            style: const TextStyle(
                fontSize: 28,
                color: MainColors.buttonBoxColor,
                fontWeight: FontWeight.bold),
          ),
          Text(
            widget.product.ad,
            style: const TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 7, 67, 102),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: MainColors.buttonBoxColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: _decrementProductCount,
                    color: Colors.white,
                    iconSize: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Text(
                    '$_productCount',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: MainColors.buttonBoxColor,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _incrementProductCount,
                    color: Colors.white,
                    iconSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                height: 50,
                child: TextButton(
                  onPressed: () {}, // Burada bir işlev ekleyebilirsiniz.
                  child: Text(
                    "Toplam: ${_changeCount.toString()} ₺",
                    style: const TextStyle(
                      fontSize: 22,
                      color: MainColors.buttonBoxColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 170,
                height: 55,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: MainColors.buttonBoxColor,
                    foregroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {}, // Burada bir işlev ekleyebilirsiniz.
                  child: const Text("Sepete Ekle"),
                ),
              ),
            ],
          ),
        ],
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
