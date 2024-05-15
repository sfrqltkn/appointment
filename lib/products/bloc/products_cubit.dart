import 'package:appointment/data/model/products_model.dart';
import 'package:appointment/data/repository/products_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsCubit extends Cubit<List<Products>> {
  ProductsCubit() : super(<Products>[]);

  var pRepo = ProductsRepository();

  Future<void> productsGet() async {
    var liste = await pRepo.getProducts();
    emit(liste);
  }
}