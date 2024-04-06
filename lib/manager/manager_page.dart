import 'package:appointment/account/view/account_page.dart';
import 'package:appointment/appointment/view/appointment_page.dart';
import 'package:appointment/galery/view/galery_page.dart';
import 'package:appointment/home/view/home_page.dart';
import 'package:appointment/utils/enums/pages_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../home/bloc/page_cubit.dart';
import '../home/bloc/page_state.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  State<ManagerPage> createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  late PageCubit _pageCubit;

  @override
  void initState() {
    super.initState();
    _pageCubit = PageCubit();
  }

  @override
  void dispose() {
    _pageCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, PageState>(
      bloc: _pageCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Beauty"),
          ),
          drawer: NavigationDrawer(
            selectedIndex: _pageIndexForStateDrawer(state),
            onDestinationSelected: (drawerIndex) {
              _pageCubit.changePageKey(_pageKeyForIndexDrawer(drawerIndex));
              Navigator.pop(context);
            },
            children: [
              const SizedBox(height: 30),
              _buildNavigationDrawer(state, Icons.person, "Hesabım", 0),
              const SizedBox(height: 10),
              const Divider(height: 4),
              const SizedBox(height: 10),
              _buildNavigationDrawer(
                  state, Icons.book_online, "Randevularım", 1),
              const SizedBox(height: 10),
              const Divider(height: 4),
              const SizedBox(height: 10),
              _buildNavigationDrawer(
                  state, Icons.collections_bookmark, "Galery", 2),
              const SizedBox(height: 10),
              const Divider(height: 4),
              const SizedBox(height: 10),
              _buildNavigationDrawer(state, Icons.info, "Hakkımızda", 3),
              const SizedBox(height: 10),
              const Divider(height: 4),
              const SizedBox(height: 10),
              _buildNavigationDrawer(
                  state, Icons.contact_support, "İletişim ", 3),
              const Divider(height: 4),
              const SizedBox(height: 10),
              const SizedBox(height: 20),
            ],
          ),
          body: _getBodyForState(state),
          bottomNavigationBar: NavigationBar(
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            selectedIndex: _pageIndexForState(state),
            height: 60,
            elevation: 0,
            onDestinationSelected: (int index) {
              if (index == 0) {
                setState(() {
                  context.read<PageCubit>().changePageKey(PageKeys.homePage);
                });
              }

              _pageCubit.changePageKey(_pageKeyForIndex(index));
            },
            destinations: [
              _buildNavigationBottom(Icons.home, "Home"),
              _buildNavigationBottom(Icons.collections_bookmark, "Galery"),
              _buildNavigationBottom(Icons.person, "Hesabım"),
            ],
          ),
        );
      },
    );
  }

  NavigationDestination _buildNavigationBottom(
      IconData icon, String labelText) {
    return NavigationDestination(
      selectedIcon: Icon(
        icon,
        color: HexColor("#A29B9B"),
      ),
      icon: Icon(icon),
      label: labelText,
    );
  }

  NavigationDrawerDestination _buildNavigationDrawer(
      PageState state, IconData icon, String labelText, int index) {
    return NavigationDrawerDestination(
      icon: Icon(icon,
          color: _pageIndexForStateDrawer(state) == index
              ? HexColor("#6D412D")
              : HexColor("#A29B9B")),
      label: Text(
        labelText,
        style: TextStyle(
          color: _pageIndexForStateDrawer(state) == index
              ? HexColor("#6D412D")
              : HexColor("#A29B9B"),
        ),
      ),
    );
  }

  Widget _getBodyForState(PageState state) {
    switch (state.pageKey) {
      case PageKeys.homePage:
        return const HomePage();
      case PageKeys.galleryView:
        return const GaleryPage();
      case PageKeys.myAccountView:
        return const AccountPage();
      case PageKeys.appointmentView:
        return const AppointmentPage();
    }
  }

  PageKeys _pageKeyForIndex(int index) {
    switch (index) {
      case 0:
        return PageKeys.homePage;
      case 1:
        return PageKeys.galleryView;
      case 2:
        return PageKeys.myAccountView;
      case 3:
        return PageKeys.appointmentView;
      default:
        return PageKeys.homePage;
    }
  }

  int _pageIndexForState(PageState state) {
    switch (state.pageKey) {
      case PageKeys.homePage:
        return 0;
      case PageKeys.galleryView:
        return 1;
      case PageKeys.myAccountView:
        return 2;
      case PageKeys.appointmentView:
        return 3;
    }
  }

  PageKeys _pageKeyForIndexDrawer(int index) {
    switch (index) {
      case 0:
        return PageKeys.myAccountView;
      case 1:
        return PageKeys.appointmentView;
      case 2:
        return PageKeys.galleryView;
      case 3:
        return PageKeys.myAccountView;
      default:
        return PageKeys.myAccountView;
    }
  }

  int _pageIndexForStateDrawer(PageState state) {
    switch (state.pageKey) {
      case PageKeys.myAccountView:
        return 0;
      case PageKeys.appointmentView:
        return 1;
      case PageKeys.galleryView:
        return 2;
      case PageKeys.homePage:
        return 6;
    }
  }
}
