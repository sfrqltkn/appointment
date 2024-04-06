import 'package:appointment/data/model/operation_model.dart';

class AppointmentState {
  final bool isLoading;
  final List<OperationModel> operations;
  final OperationModel? selectedOperation;
  AppointmentState(
      {required this.isLoading,
      required this.operations,
      this.selectedOperation});

  AppointmentState.initial({
    bool? isLoading,
    List<OperationModel>? operations,
    this.selectedOperation,
  })  : isLoading = isLoading ?? false,
        operations = operations ?? [];

  AppointmentState copyWith({
    bool? isLoading,
    List<OperationModel>? operations,
    OperationModel? selectedOperation,
  }) {
    return AppointmentState(
        isLoading: isLoading ?? this.isLoading,
        selectedOperation: selectedOperation ?? this.selectedOperation,
        operations: operations ?? this.operations);
  }
}
