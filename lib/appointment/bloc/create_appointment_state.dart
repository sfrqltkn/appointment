import 'package:appointment/data/model/operation_model.dart';

import '../../data/model/person_model.dart';

class CreateAppointmentState {
  final bool isLoading;
  final List<OperationModel> operations;
  final OperationModel? selectedOperation;

  final List<PersonModel> persons;
  final PersonModel? selectedPerson;

  CreateAppointmentState({
    required this.isLoading,
    required this.operations,
    this.selectedOperation,
    required this.persons,
    this.selectedPerson,
  });

  CreateAppointmentState.initial({
    bool? isLoading,
    List<OperationModel>? operations,
    List<PersonModel>? persons,
    this.selectedPerson,
    this.selectedOperation,
  })  : isLoading = isLoading ?? false,
        persons = persons ?? [],
        operations = operations ?? [];

  CreateAppointmentState copyWith(
      {bool? isLoading,
      List<OperationModel>? operations,
      OperationModel? selectedOperation,
      List<PersonModel>? persons,
      PersonModel? selectedPerson}) {
    return CreateAppointmentState(
        selectedPerson: selectedPerson ?? this.selectedPerson,
        persons: persons ?? this.persons,
        isLoading: isLoading ?? this.isLoading,
        selectedOperation: selectedOperation ?? this.selectedOperation,
        operations: operations ?? this.operations);
  }
}
