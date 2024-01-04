// import 'package:appointment/presentation/appointment_make/appointment_make.dart';
import 'package:appointment/ui/cubit/make_appointmentcubit.dart';
import 'package:appointment/ui/home_page.dart';
import 'package:appointment/presentation/home/pictures_page.dart';
import 'package:appointment/ui/login_page.dart';
import 'package:appointment/presentation/login/sign_up_page.dart';
import 'package:appointment/ui/make_appointment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MakeAppoCubit())],
      child: MaterialApp(
        title: 'Firebase Auth',
        debugShowCheckedModeBanner: false,
        routes: {
          "/login_page": (context) => const LoginPage(),
          "/sign_page": (context) => const SignUpPage(),
          "/home_page": (context) => const HomePage(),
          "/pictures_page": (context) => const PicturePage(),
          "/appointMake_page": (context) => const ApointmentMake(),
        },
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                fontFamily: 'Montserrat',
              ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}
