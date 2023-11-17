import 'package:appointment/decorations_and_colors/decorations/login_page_decorations.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 181, 183, 184),
        drawer: const Appbardrawer(),
        appBar: AppBar(
          foregroundColor: Colors.black,
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
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Positioned(
                      child: Image.asset(
                        "assets/images/womenImage.jpg",
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    left: 95,
                    right: 95,
                    height: 40,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: ContainerBoxDecorations.buttonDecoration(),
                      child: TextButton(
                        onPressed: () {
                          // Butona tıklandığında yapılacak işlemler
                        },
                        child: const Text(
                          'Randevu Al',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Row(
                children: [
                  CustomImageContainer(
                      imagePath: "assets/images/sactasarim.jpg"),
                  CustomImageContainer(imagePath: "assets/images/bakim.jpg"),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 2, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextContainer(
                      text: "Saç Tasarım",
                      onPressed: "Saç Tasarım",
                    ),
                    CustomTextContainer(text: "Bakım", onPressed: "Bakım"),
                  ],
                ),
              ),
              const Row(
                children: [
                  CustomImageContainer(imagePath: "assets/images/güzellik.jpg"),
                  CustomImageContainer(imagePath: "assets/images/ürünler.jpg"),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 2, bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextContainer(
                        text: "Güzellik", onPressed: "Güzellik"),
                    CustomTextContainer(text: "Ürünler", onPressed: "Ürünler"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 20, left: 22),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Positioned(
                          child: Image.asset(
                            "assets/images/galeri.png",
                            width: 370,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          bottom: 150,
                          left: 95,
                          right: 95,
                          height: 60,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[800],
                            ),
                            child: TextButton(
                              onPressed: () {
                                // Butona tıklandığında yapılacak işlemler
                              },
                              child: const Text(
                                'Galeri',
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
                        "Hemen arayın sizi bilgilendirelim",
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
                              color: Colors.green..shade900,
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
              if (index == 2) {
                Navigator.pushNamed(context, "/login_page");
              } else {
                currentPageIndex = index;
              }
            });
          },
          indicatorColor: Colors.blueGrey,
          selectedIndex: currentPageIndex,
          destinations: <Widget>[
            NavBarIcon(
                IconSize: 25,
                icon: Icons.home_outlined,
                LabelText: 'Ana Sayfa'),
            NavBarIcon(
                IconSize: 25,
                LabelText: 'Bildirimler',
                icon: Icons.notifications_active),
            NavBarIcon(
                IconSize: 30, LabelText: 'Çıkış', icon: Icons.exit_to_app),
          ],
        ),
      ),
    );
  }
}

class NavBarIcon extends StatelessWidget {
  final double IconSize;
  final String LabelText;
  final IconData icon;

  NavBarIcon(
      {super.key,
      required this.IconSize,
      required this.LabelText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: Icon(
        Icons.home,
        size: IconSize,
      ),
      icon: Icon(icon),
      label: LabelText,
    );
  }
}

class Appbardrawer extends StatelessWidget {
  const Appbardrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: ListView(
        padding: const EdgeInsets.only(top: 35),
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Hesabım'),
            onTap: () {
              // Burada çekmece öğesine tıklandığında yapılacak işlemleri ekleyebilirsiniz.
              // Örneğin, bir sayfaya yönlendirme yapabilirsiniz.
              Navigator.pop(context); // Çekmeceyi kapat
            },
          ),
          ListTile(
            leading: const Icon(Icons.book_online),
            title: const Text('Randevularım'),
            onTap: () {
              // Burada çekmece öğesine tıklandığında yapılacak işlemleri ekleyebilirsiniz.
              // Örneğin, bir sayfaya yönlendirme yapabilirsiniz.
              Navigator.pop(context); // Çekmeceyi kapat
            },
          ),
          ListTile(
            leading: const Icon(Icons.category),
            title: const Text('Ürünler'),
            onTap: () {
              // Burada çekmece öğesine tıklandığında yapılacak işlemleri ekleyebilirsiniz.
              // Örneğin, bir sayfaya yönlendirme yapabilirsiniz.
              Navigator.pop(context); // Çekmeceyi kapat
            },
          ),
          ListTile(
            leading: const Icon(Icons.collections_bookmark),
            title: const Text('Galeri'),
            onTap: () {
              // Burada çekmece öğesine tıklandığında yapılacak işlemleri ekleyebilirsiniz.
              // Örneğin, bir sayfaya yönlendirme yapabilirsiniz.
              Navigator.pop(context); // Çekmeceyi kapat
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Hakkımızda'),
            onTap: () {
              // İkinci çekmece öğesine tıklandığında yapılacak işlemleri ekleyebilirsiniz.
              Navigator.pop(context); // Çekmeceyi kapat
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_support),
            title: const Text('İletişim'),
            onTap: () {
              // İkinci çekmece öğesine tıklandığında yapılacak işlemleri ekleyebilirsiniz.
              Navigator.pop(context); // Çekmeceyi kapat
            },
          ),
        ],
      ),
    );
  }
}

class CustomImageContainer extends StatelessWidget {
  final String imagePath;

  const CustomImageContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 10),
      child: Image.asset(
        imagePath,
        width: 170,
        height: 230,
        fit: BoxFit.cover,
      ),
    );
  }
}

class CustomTextContainer extends StatelessWidget {
  final String text;
  final String onPressed;

  const CustomTextContainer(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: 173,
      height: 33,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            const Color.fromARGB(255, 96, 125, 139),
          ),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              String titleText = onPressed;
              String contentText = '';

              if (onPressed == 'Saç Tasarım') {
                contentText =
                    '> Kesim-Fön \n> Topuz\n> Gelin Saçı\n> Maşa Düzleştirici\n> Keratin Bakım\n> Boya\n> Röfle';
              } else if (onPressed == 'Bakım') {
                contentText = '> Manikür \n> Pedikür\n> Kaş\n> Peeling\n> Ağda';
              } else if (onPressed == 'Güzellik') {
                contentText = '> Makyaj \n> İpek Kirpik \n> French Oje';
              } else if (onPressed == 'Ürünler') {
                contentText =
                    '> Skin Care Cream \n> Liguid Eyeliner \n> Göz Altı Maskesi ';
              }

              return AlertDialog(
                backgroundColor: const Color.fromARGB(255, 66, 90, 102),
                title: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        titleText,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
                content: buildAlertDialogContent(contentText),
              );
            },
          );
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildAlertDialogContent(String contentText) {
    return SingleChildScrollView(
      child: ListBody(
        children: <Widget>[
          Text(
            contentText,
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
