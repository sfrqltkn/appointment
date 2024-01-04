import 'package:appointment/data/entity/products.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MakeAppoCubit extends Cubit<List<Products>> {
  MakeAppoCubit() : super(<Products>[]);

  //Firestore koleksiyon referansı oluşturuluyor. Bu referans, Firestore veritabanındaki "Product" koleksiyonuna işaret eder.
  var collectionProduct = FirebaseFirestore.instance.collection("Products");

  Future<void> productUpload() async {
    //"Products" koleksiyonundaki tüm belgeleri almak için Firestore'dan veri çekme işlemidir. Bu işlem asenkron olduğu için then metodu kullanılarak işlem tamamlandığında yapılacak işlemler belirtilir.
    collectionProduct.get().then((value) {
      var productList = <Products>[];
      //value.docs ifadesi, Firestore'dan gelen belgeleri temsil eden bir liste döndürür.
      var documents = value.docs;
      for (var document in documents) {
        //Gelen her collection bir benzersiz id ye ve data ya sahiptir bunların oluşturduğumuz key ve dataya atadık
        var key = document.id;
        var data = document.data();
        var product = Products.fromJson(data, key);
        productList.add(product);
      }
      // emit() sayesinde veriyi dinliycez ve ana sayfada bu veriyi kullanıcaz yani yakalıycaz ve GÖSTERİCEZ.
      emit(productList);
    });
  }
}
