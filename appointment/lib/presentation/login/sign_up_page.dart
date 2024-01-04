// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print
import 'package:appointment/decorations_and_colors/colors/login_page_colors.dart';
import 'package:appointment/decorations_and_colors/decorations/login_page_decorations.dart';
import 'package:appointment/ui/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPage();
}

class _SignUpPage extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              signUpButton(),
              backToLoginPage(),
            ],
          )
        ],
      ),
    );
  }

  Future<void> signUp() async {
    try {
      if (emailController.text.isEmpty || passwordController.text.isEmpty) {
        _setErrorMessage("Lütfen tüm alanları doldurunuz");
        return;
      }

      var userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      if (userCredential.user != null) {
        // Yeni kullanıcı başarıyla oluşturuldu
        _setErrorMessage("Kayıt Başarılı");
        await Future.delayed(Duration(seconds: 2));

        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      } else {
        // Kullanıcı oluşturulurken bir sorun oluştu
        _setErrorMessage("Beklenmedik bir hata oluştu. Lütfen tekrar deneyin.");
      }
    } catch (e) {
      setState(() {
        if (e.toString().contains("email-already-in-use")) {
          errorMessageEmpty = "Bu e-posta adresi zaten kullanımda.";
        } else if (e.toString().contains("invalid-email")) {
          errorMessageEmpty = "Geçersiz e-posta adresi formatı.";
        } else if (e.toString().contains("weak-password")) {
          errorMessageEmpty = "Şifre zayıf. Daha güçlü bir şifre seçin.";
        } else {
          errorMessageEmpty =
              "Beklenmedik bir hata meydana geldi. Lütfen tekrar deneyin.";
        }
      });
    }
  }

  //Mesaj Değişikliği yeri
  void _setErrorMessage(String message) {
    setState(() {
      errorMessageEmpty = message;
    });
  }

  // ignore: non_constant_identifier_names
  Widget CustomSizedBox() => SizedBox(
        height: 15,
      );

  Widget signUpButton() {
    return Container(
      decoration: ContainerBoxDecorations.buttonDecoration(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            onPressed: signUp,
            child: Text(
              "Kayıt Ol",
              style: TextStyle(
                color: MainColors.buttonFontColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
} //LoginPage Bitiş Yeri

//AppBar Yerine Kullanılan Image
Container topImageContainer(double height, String topImage) {
  return Container(
    height: height * .25,
    decoration: BoxDecoration(
      image: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(topImage),
      ),
    ),
  );
}

// Burası hoş geldiniz mesaj fonksiyonu
// ignore: camel_case_types, unused_element
class _homepagetext extends StatelessWidget {
  const _homepagetext();

  @override
  Widget build(BuildContext context) {
    return Text(
      " Merhaba, \n HoşGeldiniz",
      style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: MainColors.headerAndForgotAccountColor),
    );
  }
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

//Email TextField
class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      style: TextStyle(color: MainColors.headerAndForgotAccountColor),
      decoration: InputDecorationBuilder.textFormDecorationMail(),
    );
  }
}

//Password TextField
class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: passwordController,
      style: TextStyle(color: MainColors.headerAndForgotAccountColor),
      decoration: InputDecorationBuilder.textFormDecorationPassword(false),
    );
  }
}

// ignore: camel_case_types
class backToLoginPage extends StatelessWidget {
  const backToLoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: ContainerBoxDecorations.buttonDecoration(),
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, "/login_page"),
          child: Text(
            "Giriş Sayfasına Dön",
            style: TextStyle(
              color: MainColors.buttonFontColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

//Eror Mesaj
// ignore: camel_case_types
class _erorMessage extends StatelessWidget {
  const _erorMessage({
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: TextStyle(color: MainColors.erorMessageColor, fontSize: 18),
      ),
    );
  }
}
