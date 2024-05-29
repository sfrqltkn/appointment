import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/appointment_show_cubit.dart';
import '../bloc/appointment_show_state.dart';
import '../widget/my_appointment_items_widget.dart';
import '../widget/my_appointment_text_widget.dart';

class AppointmentsShowPage extends StatelessWidget {
  const AppointmentsShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<AppointmentShowCubit, AppointmentShowState>(
      builder: (context, state) {
        if (state.data?.isEmpty ?? true) return const Text('Bir hata oluştu');
        final userData = state.data!.first;
        return ListView(
          children: [
            MyAppointmentText(text: LocaleConstants.operation),
            MyAppointmentItems(size: size, itemsContent: userData.operation),
            MyAppointmentText(text: LocaleConstants.person),
            MyAppointmentItems(size: size, itemsContent: userData.person),
            MyAppointmentText(text: LocaleConstants.day),
            MyAppointmentItems(size: size, itemsContent: userData.day),
            MyAppointmentText(text: LocaleConstants.date),
            MyAppointmentItems(size: size, itemsContent: userData.date),
            MyAppointmentText(text: LocaleConstants.time),
            MyAppointmentItems(size: size, itemsContent: userData.time),
          ],
        );
      },
    );
  }
}
