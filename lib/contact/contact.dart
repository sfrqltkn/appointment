import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home/bloc/page_cubit.dart';
import '../home/widgets/gesture_dedector.dart';
import '../utils/enums/constant.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.location_on,
                    size: 40,
                  )),
              const Text(
                "Yenidoğan, Turhan Baytop Sokak\n No:1, 38280 Talas/Kayseri",
                textAlign: TextAlign.center,
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black87,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.call,
                    size: 40,
                  )),
              TextButton(
                onPressed: () {
                  callNumber();
                },
                child: const Text(
                  "0 312 258 45 58",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black87,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 100),
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
  }
}

Uri dialnumber = Uri(scheme: 'tel', path: '0 312 258 45 58');

callNumber() async {
  await launchUrl(dialnumber);
}
