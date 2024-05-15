import 'package:appointment/account/cubit/account_get_user_cubit.dart';
import 'package:appointment/account/cubit/account_update_user_cubit.dart';
import 'package:appointment/data/model/users_model.dart';
import 'package:appointment/account/widgets/users_info_field.dart';
import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  static const String routeName = "/my_account";

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final email = TextEditingController();
  late String erormessageEmpty = "";
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    await context.read<AccountGetCubit>().getUser().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : BlocBuilder<AccountGetCubit, List<Users>>(
            builder: (context, usersList) {
              if (usersList.isNotEmpty) {
                var userData = usersList.first;
                return ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Text(
                      erormessageEmpty,
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 40),
                    UserInfoField(
                      userController: firstName,
                      userData: userData.firstname,
                      userDatatext: "firstname",
                      labelText: LocaleConstants.name,
                    ),
                    const SizedBox(height: 20),
                    UserInfoField(
                      userController: lastName,
                      userData: userData.lastname,
                      userDatatext: "lastname",
                      labelText: LocaleConstants.surname,
                    ),
                    const SizedBox(height: 20),
                    UserInfoField(
                      userController: phoneNumber,
                      userData: userData.phoneNumber,
                      userDatatext: "phoneNumber",
                      labelText: LocaleConstants.phoneNumber,
                    ),
                    const SizedBox(height: 20),
                    UserInfoField(
                      userController: email,
                      userData: userData.email,
                      userDatatext: "email",
                      labelText: LocaleConstants.email,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        context.read<AccountUpdateCubit>().update(
                              userData.userId,
                              firstName.text,
                              lastName.text,
                              phoneNumber.text,
                              email.text,
                            );
                        setState(() {});
                      },
                      child: Text(
                        LocaleConstants.updateButton,
                        style: const TextStyle(
                          fontSize: 20,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: Text('No data available'));
              }
            },
          );
  }
}
