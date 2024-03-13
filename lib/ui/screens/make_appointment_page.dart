import 'package:flutter/material.dart';

class MakeAppointment extends StatefulWidget {
  const MakeAppointment({super.key});
  static const String routeName = "/make_appo";

  @override
  State<MakeAppointment> createState() => _MakeAppointmentState();
}

class _MakeAppointmentState extends State<MakeAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beauty"),
      ),
    );
  }
}
