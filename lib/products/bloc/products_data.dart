import 'package:provider/provider.dart';
import '../../data/model/products_model.dart';
import '../../providers/shopping_provider/shopping_state_provider.dart';

void addSelectedItems(context, Products product) {
  final shoppingProvider =
      Provider.of<ShoppingStateProvider>(context, listen: false);

  if (product.price == 550) {
    if (shoppingProvider.isProductWithPrice550Exists() == true) {
      shoppingProvider.shoppingCareCreamItems.add(product);
      shoppingProvider
          .changecareCount(shoppingProvider.shoppingCareCreamItems.length);
    } else {
      shoppingProvider.shoppingCareCreamItems.add(product);
      shoppingProvider.shoppingItems.add(product);
      shoppingProvider
          .changecareCount(shoppingProvider.shoppingCareCreamItems.length);
    }
  } else if (product.price == 450) {
    if (shoppingProvider.isProductWithPrice450Exists() == true) {
      shoppingProvider.shoppingIntensiveItems.add(product);
      shoppingProvider
          .changeintensiveCount(shoppingProvider.shoppingIntensiveItems.length);
    } else {
      shoppingProvider.shoppingIntensiveItems.add(product);
      shoppingProvider.shoppingItems.add(product);
      shoppingProvider
          .changeintensiveCount(shoppingProvider.shoppingIntensiveItems.length);
    }
  } else if (product.price == 250) {
    if (shoppingProvider.isProductWithPrice250Exists() == true) {
      shoppingProvider.shoppingHerbalItems.add(product);
      shoppingProvider
          .changecareCount(shoppingProvider.shoppingHerbalItems.length);
    } else {
      shoppingProvider.shoppingHerbalItems.add(product);
      shoppingProvider.shoppingItems.add(product);
      shoppingProvider
          .changeherbalCount(shoppingProvider.shoppingHerbalItems.length);
    }
  }
}
