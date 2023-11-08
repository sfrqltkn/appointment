// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, avoid_print
import 'package:appointment/presentation/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String errorMessage = "";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    String topImage = "assets/images/topImage.png";
    return Scaffold(
      body: appBody(height, topImage),
    );
  }

  SingleChildScrollView appBody(double height, String topImage) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topImageContainer(height, topImage),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _homepagetext(),
                  CustomSizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(top: 16, bottom: 16),
                    child: _erorMessage(errorMessage: errorMessage),
                  ),
                  emailTextField(),
                  CustomSizedBox(),
                  passwordTextField(),
                  CustomSizedBox(),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: TextButton(
                        onPressed: () async {
                          await _onPressed();
                        },
                        child: _signInContainer(),
                      ),
                    ),
                  ),
                  CustomSizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        _forgotpassword(),
                        _createaccount(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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
          _setErrorMessage("Giriş Başarılı");
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
        }
      } catch (e) {
        setState(() {
          if (e.toString().contains("INVALID_LOGIN_CREDENTIALS")) {
            errorMessage = "Email veya şifre yanlış";
            return;
          }

          errorMessage =
              "Beklenmedik bir hata meydana geldi lütfen e-mail adresinizi doğru yazdığınızdan emin olun.";
        });
      }
    }
  }

  //Mesaj Değişikliği yeri
  void _setErrorMessage(String message) {
    setState(() {
      errorMessage = message;
    });
  }

  Widget CustomSizedBox() => SizedBox(
        height: 15,
      );
}

// Giriş Butonu Container
class _signInContainer extends StatelessWidget {
  const _signInContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xff31274F),
      ),
      child: Center(
        child: Text(
          "Giriş Yap",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
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
class _homepagetext extends StatelessWidget {
  const _homepagetext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      " Merhaba, \n HoşGeldiniz",
      style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
    );
  }
}

//Eror Mesaj
class _erorMessage extends StatelessWidget {
  const _erorMessage({
    super.key,
    required this.errorMessage,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        style: TextStyle(color: Colors.red),
      ),
    );
  }
}

//Email TextField
class emailTextField extends StatelessWidget {
  const emailTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'E-posta Adresi', // Kullanıcı için açıklayıcı metin
        labelStyle: TextStyle(color: const Color.fromARGB(255, 75, 36, 36)),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 3, color: Color.fromARGB(255, 75, 36, 36)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 75, 36, 36),
          ),
        ),
      ),
    );
  }
}

final emailController = TextEditingController();
final passwordController = TextEditingController();

//Password TextField
class passwordTextField extends StatelessWidget {
  const passwordTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: 'Şifre', // Kullanıcı için açıklayıcı metin
        labelStyle: TextStyle(color: const Color.fromARGB(255, 75, 36, 36)),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 3, color: Color.fromARGB(255, 75, 36, 36)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 75, 36, 36),
          ),
        ),
      ),
    );
  }
}

//Şifremi unuttum linki
class _forgotpassword extends StatelessWidget {
  const _forgotpassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Şifremi Unuttum",
          style: TextStyle(
              color: Colors.black, decoration: TextDecoration.underline),
        ),
      ),
    );
  }
}

// Hesap oluşturma
class _createaccount extends StatelessWidget {
  const _createaccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Hesap Oluştur",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
