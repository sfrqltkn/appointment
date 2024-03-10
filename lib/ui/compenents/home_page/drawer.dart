// ignore_for_file: non_constant_identifier_names
import 'package:appointment/ui/screens/account_page.dart';
import 'package:flutter/material.dart';

class ListTileBuild extends StatelessWidget {
  const ListTileBuild({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });
  final String title;
  final Icon icon;
  final Function(BuildContext)? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: () {
        if (onTap != null) {
          onTap!(context);
        } else {
          Navigator.pop(context);
        }
      },
    );
  }
}

var ListTileBuildItems = [
  ListTileBuild(
    title: "Hesabım",
    icon: const Icon(Icons.person),
    onTap: (BuildContext context) {
      Navigator.pushNamed(context, AccountPage.routeName);
    },
  ),
  const ListTileBuild(
    title: "Randevularım",
    icon: Icon(Icons.book_online),
    // onTap: (BuildContext context) {
    //   Navigator.pushNamed(context, MyAppointment.routeName);
    // },
  ),
  const ListTileBuild(title: "Galeri", icon: Icon(Icons.collections_bookmark)),
  const ListTileBuild(title: "Hakkımızda", icon: Icon(Icons.info)),
  const ListTileBuild(title: "İletişim", icon: Icon(Icons.contact_support)),
];
