import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:appointment/home/bloc/page_cubit.dart';
// import 'package:appointment/utils/enums/home_pages_key.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}

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
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
        }
      },
    );
  }
}

// ignore: non_constant_identifier_names
var ListTileBuildItems = [
  ListTileBuild(
    title: "Hesabım",
    icon: const Icon(Icons.person),
    onTap: (BuildContext context) {
      // context.read<PageCubit>().changePageKey(PageKeys.myAccountView);
    },
  ),
  ListTileBuild(
    title: "Randevularım",
    icon: const Icon(Icons.book_online),
    onTap: (BuildContext context) {
      // context.read<PageCubit>().changePageKey(PageKeys.appointmentView);
    },
  ),
  ListTileBuild(
    title: "Galeri",
    icon: const Icon(Icons.collections_bookmark),
    onTap: (BuildContext context) {
      // context.watch<PageCubit>().changePageKey(PageKeys.galleryView);
    },
  ),
  const ListTileBuild(title: "Hakkımızda", icon: Icon(Icons.info)),
  const ListTileBuild(title: "İletişim", icon: Icon(Icons.contact_support)),
];
