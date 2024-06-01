import 'package:appointment/appointment/bloc/choose_date_state.dart';
import 'package:appointment/data/repository/choose_date_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseDateCubit extends Cubit<ChooseDateState> {
  ChooseDateCubit() : super(ChooseDateState());

  var chooseRepo = ChooseDateRepository();

  Future<void> updateAndCreate(String userId, String date, String day,
      String time, String price, String operation, String person) async {
    emit(state.copyWith(isLoading: true));
    final result = await chooseRepo.updateAndCreate(
        userId, date, day, time, price, operation, person);
    if (!result) {
      emit(state.copyWith(
          isLoading: false, errorMessage: "Appointment did not created"));
      return;
    }
    emit(state.copyWith(isLoading: false, isCreated: true));
  }

  void resetErorMessage(){
    emit(state.copyWith(errorMessage: ""));
  }
}
