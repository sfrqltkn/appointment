import 'package:appointment/appointment/bloc/appointment_show_cubit.dart';
import 'package:appointment/home/bloc/page_state.dart';
import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../home/bloc/page_cubit.dart';
import '../../utils/enums/pages_key.dart';
import '../bloc/appointment_show_state.dart';

class AppointmentManagerPage extends StatefulWidget {
  const AppointmentManagerPage({super.key});

  @override
  State<AppointmentManagerPage> createState() => AppointmentManagerPageState();
}

class AppointmentManagerPageState extends State<AppointmentManagerPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => AppointmentShowCubit()..getShowAppointment(),
      child: BlocBuilder<PageCubit, PageState>(
        builder: (pageContext, pageState) {
          return BlocBuilder<AppointmentShowCubit, AppointmentShowState>(
            builder: (context, state) {
              final headerTitle = state.data?.isNotEmpty ?? false
                  ? LocaleConstants.alertTitle
                  : LocaleConstants.alertTitle2;
              final contentTitle = state.data?.isNotEmpty ?? false
                  ? LocaleConstants.alertContent
                  : LocaleConstants.alertContent2;
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return AlertDialog(
                title: Text(" $headerTitle"),
                content: SizedBox(
                  width: size.width / 1,
                  height: size.width * 0.2,
                  child: Text(contentTitle),
                ),
                insetPadding: const EdgeInsets.all(10.0),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      state.data?.isNotEmpty ?? false
                          ? pageContext
                              .read<PageCubit>()
                              .changePageKey(PageKeys.appointmentShowView)
                          : pageContext
                              .read<PageCubit>()
                              .changePageKey(PageKeys.createAppontmentView);
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
                    child: Text(LocaleConstants.alertYes),
                  ),
                  const SizedBox(width: 5),
                  ElevatedButton(
                    onPressed: () {
                      pageContext
                          .read<PageCubit>()
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
                    child: Text(LocaleConstants.bottomHome),
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
        },
      ),
    );
  }
}
