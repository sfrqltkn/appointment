import 'package:appointment/data/model/operation_model.dart';
import 'package:appointment/data/repository/appointment_repository.dart';
import 'package:appointment/data/repository_services.dart/appointment_repository_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'appointment_state.dart';

class AppointmentCubit extends Cubit<AppointmentState> {
  final AppointmentRepositoryService _repositoryService;
  AppointmentCubit({AppointmentRepositoryService? repositoryService})
      : _repositoryService = repositoryService ?? AppointmentRepository(),
        super(AppointmentState.initial());

  Future<void> getOperations() async {
    emit(state.copyWith(isLoading: true));
    final result = await _repositoryService.getOperations();
    emit(state.copyWith(isLoading: false, operations: result ?? []));
  }
  void setSelectedOperation(OperationModel operationModel){
    emit(state.copyWith(selectedOperation: operationModel));
  }
}
