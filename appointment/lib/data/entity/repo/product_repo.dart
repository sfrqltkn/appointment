import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  var collectionProduct = FirebaseFirestore.instance.collection("Products");

  Future<void> sil(String id) async {
    collectionProduct.doc(id).delete();
  }
}
