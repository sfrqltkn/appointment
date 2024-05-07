import 'package:appointment/appointment/bloc/my_appointment_get_cubit.dart';
import 'package:appointment/data/model/my_appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/my_appointment_items_widget.dart';
import '../widget/my_appointment_text_widget.dart';

class MyAppointmentPage extends StatefulWidget {
  const MyAppointmentPage({super.key});

  static const String routeName = "/my_account";

  @override
  State<MyAppointmentPage> createState() => MyAppointmentPageState();
}

class MyAppointmentPageState extends State<MyAppointmentPage> {
  final date = TextEditingController();
  final day = TextEditingController();
  final person = TextEditingController();
  final operation = TextEditingController();
  final time = TextEditingController();
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    await context.read<MyAppointmentGetCubit>().getMyAppointment().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : BlocBuilder<MyAppointmentGetCubit, List<MyAppointmentModel>>(
            builder: (context, currentAppointment) {
              if (currentAppointment.isNotEmpty) {
                var userData = currentAppointment.first;
                return ListView(
                  children: [
                    const MyAppointmentText(text: "Operation"),
                    MyAppointmentItems(
                        size: size, itemsContent: userData.operation),
                    const MyAppointmentText(text: "Person"),
                    MyAppointmentItems(
                        size: size, itemsContent: userData.person),
                    const MyAppointmentText(text: "Day"),
                    MyAppointmentItems(size: size, itemsContent: userData.day),
                    const MyAppointmentText(text: "Date"),
                    MyAppointmentItems(size: size, itemsContent: userData.date),
                    const MyAppointmentText(text: "Time"),
                    MyAppointmentItems(size: size, itemsContent: userData.time),
                  ],
                );
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          );
  }
}
