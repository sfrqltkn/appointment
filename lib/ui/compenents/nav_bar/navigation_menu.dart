import 'package:appointment/ui/screens/account_page.dart';
import 'package:appointment/ui/screens/galery_view_page.dart';
import 'package:appointment/ui/screens/home_page.dart';
import 'package:appointment/ui/screens/login/login_page.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _MyAppState();
}

class _MyAppState extends State<BottomNavigation> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screen = [
    const HomePage(),
    const AccountPage(),
    const GaleryViewPage(),
  ];
  final items = [
    CurvedNavigationBarItem(
        child: const Icon(Icons.home_outlined, size: 33),
        label: 'Home',
        labelStyle: TextStyle(color: HexColor("#40241A"))),
    CurvedNavigationBarItem(
        child: const Icon(Icons.person, size: 33),
        label: 'My Account',
        labelStyle: TextStyle(color: HexColor("#40241A"))),
    CurvedNavigationBarItem(
        child: const Icon(Icons.newspaper, size: 33),
        label: 'Chat',
        labelStyle: TextStyle(color: HexColor("#40241A"))),
    CurvedNavigationBarItem(
        child: const Icon(Icons.exit_to_app, size: 33),
        label: 'Exit',
        labelStyle: TextStyle(color: HexColor("#40241A"))),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: ClipRRect(
        child: Scaffold(
          extendBody: true,
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(
              color: HexColor("#40241A"),
            )),
            child: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: HexColor("#A29B9B"),
              height: 60,
              animationCurve: Curves.easeInOut,
              animationDuration: const Duration(milliseconds: 300),
              index: index,
              items: items,
              onTap: (index) => setState(() {
                if (index == 3) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                } else {
                  this.index = index;
                }
              }),
            ),
          ),
          body: screen[index],
        ),
      ),
    );
  }
}
