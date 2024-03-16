import 'package:appointment/ui/compenents/home_page/appointment_stack_button.dart';
import 'package:appointment/ui/compenents/home_page/drawer.dart';
import 'package:appointment/ui/compenents/home_page/stack_galery.view.dart';
import 'package:appointment/ui/compenents/home_page/gesture_dedector.dart';
import 'package:appointment/ui/compenents/home_page/operations_performed.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = "/home_page";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beauty"),
      ),
      drawer: Drawer(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 0),
          separatorBuilder: (context, index) {
            return const Divider(height: 30);
          },
          itemCount: ListTileBuildItems.length,
          itemBuilder: (BuildContext context, index) {
            return ListTileBuildItems[index];
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                ApointmentButtonStack(),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OperationsPerformed(index: 0),
                    OperationsPerformed(index: 1),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OperationsPerformed(index: 2),
                    OperationsPerformed(index: 3),
                  ],
                ),
                StackGaleryView(),
                SizedBox(height: 30),
                GestureConnection(
                  color: "#70483A",
                  assetsName: "assets/images/call.png",
                  title: "BİLGİ ALIN ",
                  description:
                      "Hemen Arayın Bilgilendirelim\n ve Randevunuzu Oluşturalım.",
                  iconData: Icons.call,
                  routers: "call",
                ),
                SizedBox(height: 150),
                GestureConnection(
                  color: "#C4C800",
                  assetsName: "assets/images/randevu.png",
                  title: "RANDEVU ALIN",
                  description:
                      "    Uygulamamızda Kolayca\n ve Hızlıca Randevu Oluşturun",
                  iconData: Icons.date_range_sharp,
                  routers: "appointment",
                ),
                SizedBox(height: 150),
                GestureConnection(
                  color: "#17FF8F",
                  assetsName: "assets/images/wp.png",
                  title: "WHATSAPP  ",
                  description:
                      "Bizimle Whatsapp Üzerinden\n    İletişime Geçin",
                  iconData: Icons.call_end_outlined,
                  routers: "whatsapp",
                ),
                SizedBox(height: 150),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
