import 'package:appointment/about/about.dart';
import 'package:appointment/account/view/account_page.dart';
import 'package:appointment/appointment/view/appointment_page.dart';
import 'package:appointment/appointment/view/my_appointment_page.dart';
import 'package:appointment/contact/contact.dart';
import 'package:appointment/data/model/products_model.dart';
import 'package:appointment/galery/view/galery_page.dart';
import 'package:appointment/home/view/home_page.dart';
import 'package:appointment/utils/enums/pages_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import '../home/bloc/page_cubit.dart';
import '../home/bloc/page_state.dart';
import '../products/view/products_page.dart';
import '../products/view/shopping_cart_page.dart';
import '../providers/appointment_select_provider/user_select.dart';
import '../utils/enums/constant.dart';

class ManagerPage extends StatefulWidget {
  const ManagerPage({super.key, required this.currentIndex});

  final int currentIndex;

  @override
  State<ManagerPage> createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  late List<Products> exPro = [
    Products(
        name: "Example Cream",
        description: "Kullanışlı",
        price: 750,
        url: "https://i.imgur.com/I23l4NZ.jpeg"),
  ];
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
            title: Text(LocaleConstants.appBar),
          ),
          drawer: NavigationDrawer(
            selectedIndex: _pageIndexForStateDrawer(state),
            onDestinationSelected: (drawerIndex) {
              _pageCubit.changePageKey(_pageKeyForIndexDrawer(drawerIndex));
              Navigator.pop(context);
            },
            children: [
              const SizedBox(height: 30),
              _buildNavigationDrawer(
                  state, Icons.person, LocaleConstants.bottomAccount, 0),
              const SizedBox(height: 10),
              const Divider(height: 4),
              const SizedBox(height: 10),
              _buildNavigationDrawer(
                  state, Icons.book_online, LocaleConstants.drawerAppo, 1),
              const SizedBox(height: 10),
              const Divider(height: 4),
              const SizedBox(height: 10),
              _buildNavigationDrawer(state, Icons.collections_bookmark,
                  LocaleConstants.bottomGalery, 2),
              const SizedBox(height: 10),
              const Divider(height: 4),
              const SizedBox(height: 10),
              _buildNavigationDrawer(
                  state, Icons.info, LocaleConstants.drawerAbout, 3),
              const SizedBox(height: 10),
              const Divider(height: 4),
              const SizedBox(height: 10),
              _buildNavigationDrawer(state, Icons.contact_support,
                  LocaleConstants.drawerContact, 4),
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
                  Provider.of<UserSelect>(context, listen: false)
                      .changeSelectPerson(false);
                });
              }
              _pageCubit.changePageKey(_pageKeyForIndex(index));
            },
            destinations: [
              _buildNavigationBottom(Icons.home, LocaleConstants.bottomHome),
              _buildNavigationBottom(
                  Icons.collections_bookmark, LocaleConstants.bottomGalery),
              _buildNavigationBottom(
                  Icons.person, LocaleConstants.bottomAccount),
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
      case PageKeys.aboutView:
        return const AboutPage();
      case PageKeys.contactView:
        return const ContactPage();
      case PageKeys.myAppointment:
        return const MyAppointmentPage();
      case PageKeys.productsView:
        return const ProductsPage();
      case PageKeys.shoppingView:
        return const ShoppingCartPage();
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
        return 0;
      case PageKeys.aboutView:
        return 0;
      case PageKeys.myAppointment:
        return 0;
      case PageKeys.contactView:
        return 0;
      case PageKeys.productsView:
        return 0;
      case PageKeys.shoppingView:
        return 0;
    }
  }

  PageKeys _pageKeyForIndexDrawer(int index) {
    switch (index) {
      case 0:
        return PageKeys.myAccountView;
      case 1:
        return PageKeys.myAppointment;
      case 2:
        return PageKeys.galleryView;
      case 3:
        return PageKeys.aboutView;
      case 4:
        return PageKeys.contactView;
      default:
        return PageKeys.myAccountView;
    }
  }

  int _pageIndexForStateDrawer(PageState state) {
    switch (state.pageKey) {
      case PageKeys.myAccountView:
        return 0;
      case PageKeys.myAppointment:
        return 1;
      case PageKeys.galleryView:
        return 2;
      case PageKeys.aboutView:
        return 3;
      case PageKeys.contactView:
        return 4;
      case PageKeys.appointmentView:
        return 5;
      case PageKeys.homePage:
        return 6;
      case PageKeys.productsView:
        return 7;
      case PageKeys.shoppingView:
        return 8;
    }
  }
}
