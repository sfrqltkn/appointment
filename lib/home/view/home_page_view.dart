import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:provider/provider.dart';

import '../widgets/appointment_stack_button.dart';
import '../widgets/gesture_dedector.dart';
import '../widgets/operations_performed.dart';
import '../widgets/products_info.dart';
import '../widgets/stack_galery.view.dart';
import '../bloc/page_cubit.dart';
import '../bloc/page_state.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, PageState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  ApointmentButtonStack(
                      changePageKey: context.read<PageCubit>().changePageKey),
                  const SizedBox(height: 50),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OperationsPerformed(index: 0),
                      OperationsPerformed(index: 1),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OperationsPerformed(index: 2),
                      OperationsPerformed(index: 3),
                    ],
                  ),
                  StackGaleryView(
                      changePageKey: context.read<PageCubit>().changePageKey),
                  const SizedBox(height: 30),
                  const ProductsInfo(),
                  const SizedBox(height: 30),
                  GestureConnection(
                    color: "#70483A",
                    assetsName: "assets/images/call.png",
                    title: LocaleConstants.getInformation,
                    description: LocaleConstants.getInfoDesc,
                    iconData: Icons.call,
                    routers: "call",
                    titleBottom: -50,
                    titleRight: 10,
                    decsBottom: -130,
                  ),
                  const SizedBox(height: 200),
                  GestureConnection(
                    changePageKey: context.read<PageCubit>().changePageKey,
                    color: "#C4C800",
                    assetsName: "assets/images/randevu.png",
                    title: LocaleConstants.getAppoCommun,
                    description: LocaleConstants.getAppoDesc,
                    iconData: Icons.date_range_sharp,
                    routers: "appointment",
                    titleBottom: -50,
                    titleRight: -15,
                    decsBottom: -130,
                  ),
                  const SizedBox(height: 200),
                  GestureConnection(
                    color: "#17FF8F",
                    assetsName: "assets/images/wp.png",
                    title: LocaleConstants.getWhatsapp,
                    description: LocaleConstants.getWhatsappDesc,
                    iconData: Icons.call_end_outlined,
                    routers: "whatsapp",
                    titleBottom: -58,
                    titleRight: 35,
                    decsBottom: -105,
                  ),
                  const SizedBox(height: 150),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
