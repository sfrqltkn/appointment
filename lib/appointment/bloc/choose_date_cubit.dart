import 'package:appointment/data/repository/choose_date_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseDateCubit extends Cubit<void> {
  ChooseDateCubit() : super(0);

  var chooseRepo = ChooseDateRepository();

  Future<void> updateAndCreate(String userId, String date, String day,
      String time, String price, String operation, String person) async {
    await chooseRepo.updateAndCreate(
        userId, date, day, time, price, operation, person);
  }
}
