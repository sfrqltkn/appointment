import 'package:appointment/appointment/bloc/my_appointment_get_cubit.dart';
import 'package:appointment/data/model/my_appointment_model.dart';
import 'package:appointment/home/bloc/page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../home/bloc/page_cubit.dart';
import '../../utils/enums/pages_key.dart';
import '../widget/my_appointment_items_widget.dart';
import '../widget/my_appointment_text_widget.dart';

class MyAppointmentPage extends StatefulWidget {
  const MyAppointmentPage({super.key});

  @override
  State<MyAppointmentPage> createState() => MyAppointmentPageState();
}

class MyAppointmentPageState extends State<MyAppointmentPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final myAppointmentCubit = context.read<MyAppointmentGetCubit>();
    await myAppointmentCubit.getMyAppointment();
    final currentMyAppointment = myAppointmentCubit.state;

    await context.read<MyAppointmentGetCubit>().getMyAppointment().then((_) {
      setState(() {
        isLoading = currentMyAppointment.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    debugPrint("isLoading ::.$isLoading");
    return isLoading
        ? BlocBuilder<MyAppointmentGetCubit, List<MyAppointmentModel>>(
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
          )
        : BlocBuilder<PageCubit, PageState>(
            builder: (context, state) {
              return AlertDialog(
                title: const Text("Mevcut bir randevunuz yok"),
                content: SizedBox(
                  width: size.width / 1.5,
                  height: size.width * 0.1,
                  child: const Text("Yeni bir randevu almak ister misiniz ?"),
                ),
                insetPadding: const EdgeInsets.all(10.0),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<PageCubit>(context)
                          .changePageKey(PageKeys.aboutView);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor("#70483A"),
                      foregroundColor: HexColor("#ffffff"),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.white38,
                      ),
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                    child: const Text("Evet"),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<PageCubit>(context)
                          .changePageKey(PageKeys.homePage);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor("#70483A"),
                      foregroundColor: HexColor("#ffffff"),
                      side: const BorderSide(
                        width: 1,
                        color: Colors.white38,
                      ),
                      shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                    ),
                    child: const Text('Ana Sayfa'),
                  ),
                ],
                backgroundColor: HexColor("#70483A"),
                contentTextStyle: TextStyle(
                  color: HexColor("#D9D9D9"),
                  fontSize: 18,
                ),
                contentPadding:
                    const EdgeInsets.only(top: 25, bottom: 30, left: 25),
                titleTextStyle: TextStyle(
                  color: HexColor("#D9D9D9"),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
                titlePadding: const EdgeInsets.only(
                    right: 45, left: 20, bottom: 10, top: 30),
              );
            },
          );
  }
}
