import 'package:appointment/data/cubit/account_get_user_cubit.dart';
import 'package:appointment/data/cubit/account_update_user_cubit.dart';
import 'package:appointment/firebase_options.dart';
import 'package:appointment/ui/screens/account_page.dart';
import 'package:appointment/ui/screens/home_page.dart';
import 'package:appointment/ui/screens/login/login_page.dart';
import 'package:appointment/ui/screens/make_appointment_page.dart';
import 'package:appointment/ui/screens/sign/sign_up_page.dart';
import 'package:appointment/ui/theme/theme_data.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider<ThemeColorData>(
      create: (BuildContext context) => ThemeColorData(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AccountCubitGet()),
        BlocProvider(create: (context) => AccountUpdateState()),
      ],
      child: MaterialApp(
        initialRoute: LoginPage.routeName,
        routes: {
          LoginPage.routeName: (context) => const LoginPage(),
          SignUpPage.routeName: (context) => const SignUpPage(),
          AccountPage.routeName: (context) => const AccountPage(),
          HomePage.routeName: (context) => const HomePage(),
          MakeAppointment.routeName: (context) => const MakeAppointment(),
        },
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeColorData>(context).themeColor,
      ),
    );
  }
}
