import 'package:appointment/appointment/bloc/appointment_cubit.dart';
import 'package:appointment/appointment/bloc/my_appointment_get_cubit.dart';
import 'package:appointment/home/bloc/page_cubit.dart';
import 'package:appointment/providers/appointment_select_provider/user_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../../utils/enums/pages_key.dart';
import '../bloc/appointment_state.dart';
import '../widget/custom_dropdown_operations_widget.dart';
import '../widget/custom_dropdown_person_widget.dart';
import '../widget/price_date_widget.dart';
import '../widget/profile_visibility_widget.dart';
import '../widget/text_widget.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  static const String routeName = "/AppointmentPage";

  @override
  State<AppointmentPage> createState() => _AppointmentState();
}

class _AppointmentState extends State<AppointmentPage> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _fetchData(context);
  }

  Future<void> _fetchData(BuildContext context) async {
    final myAppointmentCubit = context.read<MyAppointmentGetCubit>();
    await myAppointmentCubit.getMyAppointment();
    final currentMyAppointment = myAppointmentCubit.state;
    debugPrint(currentMyAppointment.toString());

    await context.read<AppointmentCubit>().getOperations().then((_) {
      setState(() {
        isLoading = currentMyAppointment.isNotEmpty;
      });
    });
    await context.read<AppointmentCubit>().getPersons().then((_) {
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
        ? AlertDialog(
            title: const Text("Mevcut bir randevunuz var"),
            content: SizedBox(
                width: size.width / 1.5,
                height: size.width * 0.1,
                child: const Text("Görüntülemek ister misiniz ?")),
            insetPadding: const EdgeInsets.all(10.0),
            actions: [
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<PageCubit>(context)
                      .changePageKey(PageKeys.myAppointment);
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
            titlePadding:
                const EdgeInsets.only(right: 45, left: 20, bottom: 10, top: 30),
          )
        : BlocProvider(
            create: (context) => AppointmentCubit()
              ..getOperations()
              ..getPersons(),
            child: BlocBuilder<AppointmentCubit, AppointmentState>(
              builder: (context, state) {
                final cubit = context.read<AppointmentCubit>();
                debugPrint(
                    "isSelectedPerson ${Provider.of<UserSelect>(context).isSelectPerson}");
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppointmentText(text: 'Operation Type'),
                      const SizedBox(height: 12),
                      if (state.operations.isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDropdownOperationWidget(
                                state: state, cubit: cubit),
                            const SizedBox(height: 20),
                            ProfileVisibility(
                                isSelectPerson: Provider.of<UserSelect>(context)
                                    .isSelectPerson,
                                selectedPersonProfileUrl:
                                    Provider.of<UserSelect>(context)
                                        .selectedPersonProfileUrl,
                                size: size),
                            const SizedBox(height: 18),
                            const AppointmentText(text: "Selected Person"),
                            const SizedBox(height: 12),
                            CustomDropdownPersonWidget(
                                state: state, cubit: cubit),
                            const SizedBox(
                              height: 50,
                            ),
                            BottomPriceAndDate(
                              priceTop: Provider.of<UserSelect>(context).price,
                              state: state,
                              activeButton: Provider.of<UserSelect>(context)
                                          .isSelectPerson &&
                                      Provider.of<UserSelect>(context)
                                          .isSelectedOperation
                                  ? true
                                  : false,
                            ),
                          ],
                        ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
