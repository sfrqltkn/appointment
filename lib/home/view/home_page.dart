import 'package:appointment/about/about.dart';
import 'package:appointment/appointment/view/my_appointment_page.dart';
import 'package:appointment/contact/contact.dart';
import 'package:appointment/galery/view/galery_page.dart';

import 'package:appointment/account/view/account_page.dart';
import 'package:appointment/products/view/products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../appointment/view/appointment_page.dart';
import '../../data/model/products_model.dart';
import '../../products/view/shopping_cart_page.dart';
import '../../utils/enums/pages_key.dart';
import '../bloc/page_cubit.dart';
import '../bloc/page_state.dart';
import 'home_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Products> exPro = [
    Products(
        name: "Example Cream",
        description: "Kullanışlı",
        price: 750,
        url: "https://i.imgur.com/I23l4NZ.jpeg"),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, PageState>(
      builder: (context, state) {
        switch (state.pageKey) {
          case PageKeys.homePage:
            return const HomePageView();
          case PageKeys.galleryView:
            return const GaleryPage();
          case PageKeys.appointmentView:
            return const AppointmentPage();
          case PageKeys.myAccountView:
            return const AccountPage();
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
      },
    );
  }
}
