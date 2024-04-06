import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../ui/compenents/home_page/appointment_stack_button.dart';
import '../../ui/compenents/home_page/gesture_dedector.dart';
import '../../ui/compenents/home_page/operations_performed.dart';
import '../../ui/compenents/home_page/stack_galery.view.dart';
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
                  const ApointmentButtonStack(),
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
                      changePageKey:
                          Provider.of<PageCubit>(context, listen: false)
                              .changePageKey),
                  const SizedBox(height: 30),
                  const GestureConnection(
                    color: "#70483A",
                    assetsName: "assets/images/call.png",
                    title: "BİLGİ ALIN ",
                    description:
                        "Hemen Arayın Bilgilendirelim\n ve Randevunuzu Oluşturalım.",
                    iconData: Icons.call,
                    routers: "call",
                  ),
                  const SizedBox(height: 150),
                  GestureConnection(
                    changePageKey:
                        BlocProvider.of<PageCubit>(context).changePageKey,
                    color: "#C4C800",
                    assetsName: "assets/images/randevu.png",
                    title: "RANDEVU ALIN",
                    description:
                        "    Uygulamamızda Kolayca\n ve Hızlıca Randevu Oluşturun",
                    iconData: Icons.date_range_sharp,
                    routers: "appointment",
                  ),
                  const SizedBox(height: 150),
                  const GestureConnection(
                    color: "#17FF8F",
                    assetsName: "assets/images/wp.png",
                    title: "WHATSAPP  ",
                    description:
                        "Bizimle Whatsapp Üzerinden\n    İletişime Geçin",
                    iconData: Icons.call_end_outlined,
                    routers: "whatsapp",
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
