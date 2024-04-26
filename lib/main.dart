import 'package:appointment/account/cubit/account_get_user_cubit.dart';
import 'package:appointment/account/cubit/account_update_user_cubit.dart';
import 'package:appointment/firebase_options.dart';
import 'package:appointment/galery/bloc/galery_cubit.dart';
import 'package:appointment/home/bloc/page_cubit.dart';
import 'package:appointment/login/view/login_page.dart';
import 'package:appointment/providers/login_and_signUp_message.dart/eror_message.dart';
import 'package:appointment/providers/theme/theme_data.dart';
import 'package:appointment/utils/enums/Constant.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeColorData>(
            create: (BuildContext context) => ThemeColorData(),
          ),
          ChangeNotifierProvider<ErrorMessage>(
            create: (BuildContext context) => ErrorMessage(),
          ),
        ],
        child: EasyLocalization(
            supportedLocales: const [
              LocaleConstants.enLocale,
              LocaleConstants.trLocale,
            ],
            path: LocaleConstants.localePath,
            saveLocale: true,
            fallbackLocale: LocaleConstants.enLocale,
            child: const MyApp())),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AccountCubitGet()),
        BlocProvider(create: (context) => AccountUpdateState()),
        BlocProvider(create: (context) => GaleryCubit()..galeryGet()),
        BlocProvider(create: (context) => PageCubit()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        routes: {
          LoginPage.routeName: (context) => const LoginPage(),
        },
        initialRoute: LoginPage.routeName,
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeColorData>(context).themeColor,
      ),
    );
  }
}
