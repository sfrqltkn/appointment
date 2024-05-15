import 'package:appointment/data/model/products_model.dart';
import 'package:appointment/utils/enums/collection_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsRepository {
  var collectionUrl =
      FirebaseFirestore.instance.collection(CollectionKeys.products.value);
  var productList = <Products>[];

  Future<List<Products>> getProducts() async {
    var querySnapshot = await collectionUrl.get();
    var documents = querySnapshot.docs;

    productList.clear();

    for (var document in documents) {
      var key = document.id;
      var data = document.data();
      var product = Products.fromJson(data, key);
      productList.add(product);
    }

    return productList;
  }
}
