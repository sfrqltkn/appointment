import 'package:appointment/decorations_and_colors/colors/login_page_colors.dart';
import 'package:appointment/decorations_and_colors/decorations/login_page_decorations.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:appointment/presentation/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String errorMessageEmpty = "";

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    String topImage = "assets/images/loginImage.png";
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: appBody(height, topImage),
    );
  }

  SingleChildScrollView appBody(double height, String topImage) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(topImage),
          //---------------------------Login Text----------------------------//
          const Padding(
            padding: EdgeInsets.only(top: 60, left: 30, bottom: 30),
            child: Row(
              children: [
                Text(
                  "Merhaba \n Hoşgeldiniz...",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: MainColors.headerAndForgotAccountColor),
                ),
              ],
            ),
          ),
          //------------------------Login Page Error Message---------------------//
          Padding(
            padding:
                const EdgeInsets.only(top: 16, bottom: 16, right: 10, left: 15),
            child: _erorMessage(errorMessage: errorMessageEmpty),
          ),
          //------------------------------FORM FIELD---------------------------//
          Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 25, right: 25, left: 25),
            child: TextFormField(
              controller: emailController,
              decoration: InputDecorationBuilder.textFormDecorationMail(),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 25, right: 25, left: 25),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration:
                  InputDecorationBuilder.textFormDecorationPassword(false),
            ),
          ),
          //-----------------------Login Button--------------------------//
          Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Container(
              height: 55,
              width: 155,
              margin: const EdgeInsets.symmetric(horizontal: 50),
              decoration: ContainerBoxDecorations.buttonDecoration(),
              child: TextButton(
                onPressed: () async {
                  await _onPressed();
                },
                child: const Text(
                  "Giriş Yap",
                  style: TextStyle(
                      color: MainColors.buttonFontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),

          //--------------Login Forgot And Account------------------//
          Padding(
            padding: const EdgeInsets.only(top: 45, left: 15, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildTextButton(
                  text: "Şifremi Unuttum",
                  onPressed: () => Navigator.pushNamed(context, "/"),
                ),
                buildTextButton(
                  text: "Hesap Oluştur",
                  onPressed: () => Navigator.pushNamed(context, "/sign_page"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _onPressed() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      _setErrorMessage("Lütfen tüm alanları doldurunuz");
    } else {
      try {
        final user = await _auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        if (user.user == null) {
          _setErrorMessage("Email veya şifre yanlış");
        } else {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        }
      } catch (e) {
        setState(() {
          if (e.toString().contains("INVALID_LOGIN_CREDENTIALS")) {
            errorMessageEmpty = "Email veya şifre yanlış";
            return;
          }

          errorMessageEmpty =
              "Beklenmedik bir hata meydana geldi lütfen tekrar deneyiniz";
        });
      }
    }
  }

  //Mesaj Değişikliği yeri
  void _setErrorMessage(String message) {
    setState(() {
      errorMessageEmpty = message;
    });
  }
}

//Eror Mesaj
// ignore: camel_case_types
class _erorMessage extends StatelessWidget {
  const _erorMessage({required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: const TextStyle(
          color: MainColors.erorMessageColor,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
