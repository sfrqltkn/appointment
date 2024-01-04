import 'package:appointment/decorations_and_colors/colors/home_page_colors.dart';
import 'package:appointment/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import 'widgets/nav_icon.dart';

class PicturePage extends StatefulWidget {
  const PicturePage({super.key});

  @override
  State<PicturePage> createState() => _PicturePageState();
}

class _PicturePageState extends State<PicturePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: HomeColors.backgroundColor,
        drawer: const Appbardrawer(),
        appBar: AppBar(
          foregroundColor: HomeColors.appBarColors,
          title: const Padding(
            padding: EdgeInsets.only(left: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Beauty",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.shopping_bag,
                  size: 29,
                ),
              ],
            ),
          ),
          backgroundColor: Colors.blueGrey,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const PhotoShow(
                  textName: "Saç Tasarımları",
                  photoOne: "assets/images/sac1.jpg.avif",
                  photoTwo: "assets/images/sac2.jpg.avif",
                  photoThree: "assets/images/sac3.jpg.avif",
                  photoFour: "assets/images/sac4.jpg.avif"),
              const PhotoShow(
                  textName: "Yüz Bakım - Makyaj",
                  photoOne: "assets/images/face3.avif",
                  photoTwo: "assets/images/face2.avif",
                  photoThree: "assets/images/face1.avif",
                  photoFour: "assets/images/face4.avif"),
              const PhotoShow(
                  textName: "İpek Kirpik - Tırnak",
                  photoOne: "assets/images/kiroj1.avif",
                  photoTwo: "assets/images/kiroj2.avif",
                  photoThree: "assets/images/kiroj3.avif",
                  photoFour: "assets/images/kiroj4.avif"),
              const PhotoShow(
                  textName: "Ürünlerimiz",
                  photoOne: "assets/images/care1.avif",
                  photoTwo: "assets/images/care2.avif",
                  photoThree: "assets/images/care3.avif",
                  photoFour: "assets/images/care4.avif"),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 25),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.yellow,
                                width: 18,
                              ),
                              borderRadius: BorderRadius.circular(120.0),
                            ),
                            child: Image.asset("assets/images/randevu.jpg"),
                          ),
                        ),
                        Positioned(
                          top: 150,
                          left: 165,
                          child: Container(
                            width: 65,
                            height: 65,
                            color: Colors.white, // Arka plan rengi
                            child: const Icon(
                              Icons.event_available,
                              color: Colors.yellow,
                              size: 55,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "RANDEVU ALIN",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Hemen randevunuzu oluşturup size yardımcı olalım",
                        style: TextStyle(
                            fontSize: 18.0, // Metin boyutu
                            color: Color.fromARGB(221, 28, 26, 26),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Stack(
                      children: [
                        Positioned(
                          child: Container(
                            margin: const EdgeInsets.only(top: 35),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.brown.shade800,
                                width: 18,
                              ),
                              borderRadius: BorderRadius.circular(120.0),
                            ),
                            child: Image.asset("assets/images/arayin.jpg"),
                          ),
                        ),
                        Positioned(
                          top: 150,
                          left: 165,
                          child: Container(
                            width: 65,
                            height: 65,
                            color: Colors.white, // Arka plan rengi
                            child: Icon(
                              Icons.call,
                              color: Colors.brown.shade800,
                              size: 55,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "BİLGİ ALIN",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Hemen arayın sizi bilgilendirelim \n +90 555 555 55 55",
                        style: TextStyle(
                            fontSize: 18.0, // Metin boyutu
                            color: Color.fromARGB(221, 28, 26, 26),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Stack(
                      children: [
                        Positioned(
                          child: Container(
                            margin: const EdgeInsets.only(top: 35),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green.shade900,
                                width: 18,
                              ),
                              borderRadius: BorderRadius.circular(120.0),
                            ),
                            child: Image.asset("assets/images/whatsapp.jpg"),
                          ),
                        ),
                        Positioned(
                          top: 150,
                          left: 165,
                          child: Container(
                            width: 65,
                            height: 65,
                            color: Colors.white, // Arka plan rengi
                            child: Icon(
                              Icons.call,
                              color: Colors.green.shade900,
                              size: 55,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "WHATSAPP",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Bizimle whatsapp üzerinden iletişime geçin",
                        style: TextStyle(
                            fontSize: 18.0, // Metin boyutu
                            color: Color.fromARGB(221, 28, 26, 26),
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          height: 70,
          onDestinationSelected: (int index) {
            setState(() {
              if (index == 1) {
                Navigator.pushNamed(context, "/login_page");
              } else if (index == 0) {
                Navigator.pushNamed(context, "/home_page");
              } else {
                currentPageIndex = index;
              }
            });
          },
          indicatorColor: Colors.blueGrey,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavBarIcon(
                iconSize: 25,
                icon: Icons.home_outlined,
                labelText: 'Ana Sayfa'),
            NavBarIcon(
                iconSize: 30, labelText: 'Çıkış', icon: Icons.exit_to_app),
          ],
        ),
      ),
    );
  }
}

class PhotoShow extends StatelessWidget {
  final String textName;
  final String photoOne;
  final String photoTwo;
  final String photoThree;
  final String photoFour;
  const PhotoShow(
      {super.key,
      required this.textName,
      required this.photoOne,
      required this.photoTwo,
      required this.photoThree,
      required this.photoFour});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 35,
          ),
          child: Container(
            width: 250,
            height: 43,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 29, 34, 62),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                textName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 172, 196, 208),
                ),
              ),
            ),
          ),
        ),
        ImageSlideshow(
          width: MediaQuery.of(context).size.height,
          height: 560,
          indicatorColor: Colors.blue,
          onPageChanged: (value) {
            debugPrint('Page changed: $value');
          },
          autoPlayInterval: 1000,
          isLoop: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Image.asset(
                photoOne,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Image.asset(
                photoTwo,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Image.asset(
                photoThree,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              child: Image.asset(
                photoFour,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
