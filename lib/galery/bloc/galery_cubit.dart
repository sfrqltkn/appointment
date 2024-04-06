import 'package:appointment/data/model/galery_view_model.dart';
import 'package:appointment/data/repository/galery_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GaleryCubit extends Cubit<List<Galery>> {
  GaleryCubit() : super(<Galery>[]);

  var grepo = GaleryRepository();

  Future<void> galeryGet() async {
    var liste = await grepo.getGalery();
    emit(liste);
  }
}
