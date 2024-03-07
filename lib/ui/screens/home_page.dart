import 'package:appointment/ui/compenents/home_page/drawer.dart';
import 'package:appointment/ui/screens/login/login_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = "/my_account";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  String selectedPage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beauty"),
      ),
      drawer: Drawer(
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
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, LoginPage.routeName);
                },
                child: const Text("Login Page")),
          ),
        ),
      ),
    );
  }
}
