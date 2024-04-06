import 'package:appointment/account/cubit/account_get_user_cubit.dart';
import 'package:appointment/account/cubit/account_update_user_cubit.dart';
import 'package:appointment/data/model/users_model.dart';
import 'package:appointment/ui/compenents/account_page/users_info_field.dart';
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
    await context.read<AccountCubitGet>().getUser().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
  }

 @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(child: CircularProgressIndicator())
        : BlocBuilder<AccountCubitGet, List<Users>>(
            builder: (context, usersList) {
              if (usersList.isNotEmpty) {
                var userData = usersList.first; // Assuming only one user
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
                      labelText: "First Name",
                    ),
                    const SizedBox(height: 20),
                    UserInfoField(
                      userController: lastName,
                      userData: userData.lastname,
                      userDatatext: "lastname",
                      labelText: "Last Name",
                    ),
                    const SizedBox(height: 20),
                    UserInfoField(
                      userController: phoneNumber,
                      userData: userData.phoneNumber,
                      userDatatext: "phoneNumber",
                      labelText: "Phone Number",
                    ),
                    const SizedBox(height: 20),
                    UserInfoField(
                      userController: email,
                      userData: userData.email,
                      userDatatext: "email",
                      labelText: "E-mail",
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        context.read<AccountUpdateState>().update(
                          userData.userId,
                          firstName.text,
                          lastName.text,
                          phoneNumber.text,
                          email.text,
                        );
                        setState(() {});
                      },
                      child: const Text(
                        "Update",
                        style: TextStyle(
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
