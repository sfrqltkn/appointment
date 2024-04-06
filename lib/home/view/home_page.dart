import 'package:appointment/galery/view/galery_page.dart';

import 'package:appointment/account/view/account_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../appointment/view/appointment_page.dart';
import '../../utils/enums/pages_key.dart';
import '../bloc/page_cubit.dart';
import '../bloc/page_state.dart';
import 'home_page_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        }
      },
    );
  }
}
