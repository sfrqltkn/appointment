import 'package:appointment/data/model/operation_model.dart';
import 'package:appointment/data/repository/appointment_repository.dart';
import 'package:appointment/data/repository_services.dart/appointment_repository_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/person_model.dart';
import 'create_appointment_state.dart';

class CreateAppointmentCubit extends Cubit<CreateAppointmentState> {
  final AppointmentRepositoryService _repositoryService;
  CreateAppointmentCubit({AppointmentRepositoryService? repositoryService})
      : _repositoryService = repositoryService ?? AppointmentRepository(),
        super(CreateAppointmentState.initial());

  Future<void> getOperations() async {
    emit(state.copyWith(isLoading: true));
    final result = await _repositoryService.getOperations();
    emit(state.copyWith(isLoading: false, operations: result ?? []));
  }

  void setSelectedOperation(OperationModel operationModel) {
    emit(state.copyWith(selectedOperation: operationModel));
  }

  void setSelectedPerson(PersonModel personModel) {
    emit(state.copyWith(selectedPerson: personModel));
  }
  
  Future<void> getPersons() async {
    emit(state.copyWith(isLoading: true));
    final result = await _repositoryService.getPerson();
    emit(state.copyWith(isLoading: false, persons: result ?? []));
  }
}
