import 'package:appointment/data/model/galery_view_model.dart';
import 'package:appointment/utils/enums/collection_keys.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GaleryRepository {
  var collectionUrl =
      FirebaseFirestore.instance.collection(CollectionKeys.galery.value);
  var urlList = <Galery>[];

  Future<List<Galery>> getGalery() async {
    var querySnapshot = await collectionUrl.get();
    var documents = querySnapshot.docs;

    urlList.clear(); // Önceki verileri temizle

    for (var document in documents) {
      var data = document.data();
      var galery = Galery.fromJson(data);
      urlList.add(galery);
    }

    debugPrint(urlList.toString());
    return urlList;
  }
}
