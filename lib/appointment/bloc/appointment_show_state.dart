import '../../data/model/my_appointment_model.dart';

class AppointmentShowState {
  final bool isLoading;
  final List<MyAppointmentModel>? data;

  AppointmentShowState({this.isLoading = false, required this.data});

  AppointmentShowState copyWith(
      {bool? isLoading, List<MyAppointmentModel>? data}) {
    return AppointmentShowState(
        data: data ?? this.data, isLoading: isLoading ?? this.isLoading);
  }
}