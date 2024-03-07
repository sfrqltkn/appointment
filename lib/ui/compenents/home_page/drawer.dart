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

// ignore: non_constant_identifier_names
var ListTileBuildItems = [
  const ListTileBuild(
    title: "Hesabım",
    icon: Icon(Icons.person),
    // onTap: (BuildContext context) {
    //   Navigator.pushNamed(context, Account.routeName);
    // },
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