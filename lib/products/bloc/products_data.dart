import 'package:flutter/cupertino.dart';
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
  } else if (product.price == 350) {
    if (shoppingProvider.isProductWithPrice350Exists() == true) {
      shoppingProvider.shoppingEyelinerItems.add(product);
      shoppingProvider
          .changeEyelinerCount(shoppingProvider.shoppingEyelinerItems.length);
    } else {
      shoppingProvider.shoppingEyelinerItems.add(product);
      shoppingProvider.shoppingItems.add(product);
      shoppingProvider
          .changeEyelinerCount(shoppingProvider.shoppingEyelinerItems.length);
    }
  } else if (product.price == 400) {
    if (shoppingProvider.isProductWithPrice400Exists() == true) {
      shoppingProvider.shoppingManukaItems.add(product);
      shoppingProvider
          .changeManukaCount(shoppingProvider.shoppingManukaItems.length);
    } else {
      shoppingProvider.shoppingManukaItems.add(product);
      shoppingProvider.shoppingItems.add(product);
      shoppingProvider
          .changeManukaCount(shoppingProvider.shoppingManukaItems.length);
    }
  } else if (product.price == 300) {
    if (shoppingProvider.isProductWithPrice300Exists() == true) {
      shoppingProvider.shoppingKriyoItems.add(product);
      shoppingProvider
          .changeKriyoCount(shoppingProvider.shoppingKriyoItems.length);
    } else {
      shoppingProvider.shoppingKriyoItems.add(product);
      shoppingProvider.shoppingItems.add(product);
      shoppingProvider
          .changeKriyoCount(shoppingProvider.shoppingKriyoItems.length);
    }
  }
}

String countItems(int itemsPrice, context) {
  final shoppingProvider = Provider.of<ShoppingStateProvider>(context);

  if (itemsPrice == 550) {
    shoppingProvider
        .changecareCount(shoppingProvider.shoppingCareCreamItems.length);
    return shoppingProvider.careCount.toString();
  } else if (itemsPrice == 250) {
    shoppingProvider
        .changeherbalCount(shoppingProvider.shoppingHerbalItems.length);
    return shoppingProvider.herbalCount.toString();
  } else if (itemsPrice == 450) {
    shoppingProvider
        .changeintensiveCount(shoppingProvider.shoppingIntensiveItems.length);
    return shoppingProvider.intensiveCount.toString();
  } else if (itemsPrice == 400) {
    shoppingProvider
        .changeManukaCount(shoppingProvider.shoppingManukaItems.length);
    return shoppingProvider.manukaCount.toString();
  } else if (itemsPrice == 350) {
    shoppingProvider
        .changeEyelinerCount(shoppingProvider.shoppingEyelinerItems.length);
    return shoppingProvider.eyelinerCount.toString();
  } else if (itemsPrice == 300) {
    shoppingProvider
        .changeKriyoCount(shoppingProvider.shoppingKriyoItems.length);
    return shoppingProvider.kriyoCount.toString();
  } else {
    return "";
  }
}

void clearProducts(int price, BuildContext context) {
  final shoppingProvider =
      Provider.of<ShoppingStateProvider>(context, listen: false);
  if (price == 550) {
    shoppingProvider.shoppingCareCreamItems.clear();
    shoppingProvider.changecareCount(0);
    shoppingProvider.removeProductsWithPrice(price);
  } else if (price == 250) {
    shoppingProvider.shoppingHerbalItems.clear();
    shoppingProvider.changeherbalCount(0);
    shoppingProvider.removeProductsWithPrice(price);
  } else if (price == 450) {
    shoppingProvider.shoppingIntensiveItems.clear();
    shoppingProvider.changeintensiveCount(0);
    shoppingProvider.removeProductsWithPrice(price);
  } else if (price == 300) {
    shoppingProvider.shoppingKriyoItems.clear();
    shoppingProvider.changeKriyoCount(0);
    shoppingProvider.removeProductsWithPrice(price);
  } else if (price == 400) {
    shoppingProvider.shoppingManukaItems.clear();
    shoppingProvider.changeManukaCount(0);
    shoppingProvider.removeProductsWithPrice(price);
  } else if (price == 350) {
    shoppingProvider.shoppingEyelinerItems.clear();
    shoppingProvider.changeEyelinerCount(0);
    shoppingProvider.removeProductsWithPrice(price);
  }
}

void chanceItemsCount(int count, Products products, BuildContext context) {
  final shoppingProvider =
      Provider.of<ShoppingStateProvider>(context, listen: false);
  final shoppingProvider2 =
      Provider.of<ShoppingStateProvider>(context, listen: false);

  if (products.price == 550) {
    shoppingProvider.shoppingCareCreamItems.clear();

    shoppingProvider.shoppingCareCreamItems
        .addAll(List.generate(count, (index) => products));
    shoppingProvider
        .changecareCount(shoppingProvider2.shoppingCareCreamItems.length);
  } else if (products.price == 450) {
    shoppingProvider.shoppingIntensiveItems.clear();

    shoppingProvider.shoppingIntensiveItems
        .addAll(List.generate(count, (index) => products));
    shoppingProvider
        .changeintensiveCount(shoppingProvider2.shoppingIntensiveItems.length);
  } else if (products.price == 250) {
    shoppingProvider.shoppingHerbalItems.clear();

    shoppingProvider.shoppingHerbalItems
        .addAll(List.generate(count, (index) => products));

    shoppingProvider
        .changeherbalCount(shoppingProvider2.shoppingHerbalItems.length);
  } else if (products.price == 350) {
    shoppingProvider.shoppingEyelinerItems.clear();

    shoppingProvider.shoppingEyelinerItems
        .addAll(List.generate(count, (index) => products));

    shoppingProvider
        .changeEyelinerCount(shoppingProvider2.shoppingEyelinerItems.length);
  } else if (products.price == 400) {
    shoppingProvider.shoppingManukaItems.clear();

    shoppingProvider.shoppingManukaItems
        .addAll(List.generate(count, (index) => products));

    shoppingProvider
        .changeManukaCount(shoppingProvider2.shoppingManukaItems.length);
  } else if (products.price == 300) {
    shoppingProvider.shoppingKriyoItems.clear();

    shoppingProvider.shoppingKriyoItems
        .addAll(List.generate(count, (index) => products));

    shoppingProvider
        .changeKriyoCount(shoppingProvider2.shoppingKriyoItems.length);
  }
}

void cartStateAfterPay(BuildContext context) {
  final shoppingProvider =
      Provider.of<ShoppingStateProvider>(context, listen: false);
  shoppingProvider.shoppingItems.clear();
  shoppingProvider.shoppingCareCreamItems.clear();
  shoppingProvider.shoppingHerbalItems.clear();
  shoppingProvider.shoppingIntensiveItems.clear();
  shoppingProvider.shoppingKriyoItems.clear();
  shoppingProvider.shoppingManukaItems.clear();
  shoppingProvider.shoppingEyelinerItems.clear();
  shoppingProvider.changecareCount(0);
  shoppingProvider.changeherbalCount(0);
  shoppingProvider.changeintensiveCount(0);
  shoppingProvider.changeEyelinerCount(0);
  shoppingProvider.changeKriyoCount(0);
  shoppingProvider.changeManukaCount(0);
}
