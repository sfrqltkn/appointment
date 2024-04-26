import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LocaleConstants {
  static const trLocale = Locale("tr", "TR");
  static const enLocale = Locale("en", "US");
  static const localePath = "assets/translations";

  /// login_page constant
  static String appBar = "Güzellik".myLocale;
  static String email = "Email".myLocale;
  static String password = "Şifre".myLocale;
  static String signButton = "Giriş Yap".myLocale;
  static String passwordForgot = "Şifremi Unuttum".myLocale;
  static String signUpMessage = "Hesabınız Yok Mu ?".myLocale;
  static String signUp = "Kayıt Ol".myLocale;

  ///Sign_up_page constant
  static String name = "Ad".myLocale;
  static String surname = "Soyad".myLocale;
  static String phoneNumber = "Telefon Numarası".myLocale;
  static String goBack = "Geri Dön".myLocale;

  ///forgot_password constant
  static String resetMessage =
      "Şifrenizi sıfırlamak için bir \n e-posta alın".myLocale;
  static String resetButton = "Şifreyi Sıfırla".myLocale;

  ///manager_page constant
  static String bottomHome = "Ana Sayfa".myLocale;
  static String bottomGalery = "Galeri".myLocale;
  static String bottomAccount = "Hesabım".myLocale;
  static String drawerAppo = "Randevularım".myLocale;
  static String drawerAbout = "Hakkımızda".myLocale;
  static String drawerContact = "İletişim".myLocale;

  ///homepage constant
  static String getAppointment = "Randevunuzu   \n    Alın".myLocale;

  ///accountpage constant
  static String updateButton = "Güncelle".myLocale;

  ///homepage operations
  static String hairOperations =
      "> Kesim \n> Topuz \n> Gelin Saçı \n> Maşa \n> Saç Düzleştirme \n> Keratin Bakım \n> Boyama \n> Röfle"
          .myLocale;
  static String hairDesign = "Saç Tasarım".myLocale;
  static String careOperations =
      "> Manikür \n> Pedikür \n> Kaş Alımı \n> Peeling \n> Ağda".myLocale;
  static String care = "Bakım".myLocale;
  static String beautyOperations =
      "> Makyaj \n> İpek Kirpik \n> French Oje".myLocale;
  static String productsOperations =
      "> Cilt Bakım Kremi \n> Liguid Eyeliner \n> Göz Altı Maskesi".myLocale;
  static String products = "Ürünler".myLocale;

  ///viewGalery
  static String galeryView = "Galeriyi Görüntüleyin".myLocale;

  ///galery_page
  static String titleOne = "Kirpik & Tırnak\n         Kaş".myLocale;
  static String titleTwo = "Saç Tasarımlarımız".myLocale;
  static String titleThree = "Makyaj & Yüz Bakım\n           Ağda".myLocale;
  static String titleFour = "Güzellik Ürünleri".myLocale;

  ///communication
  static String getInformation = " Bilgi Alın  ".myLocale;
  static String getInfoDesc =
      "Hemen Arayın Bilgilendirelim\n ve Randevunuzu Oluşturalım.".myLocale;

  static String getAppoCommun = " Randevu Alın   ".myLocale;
  static String getAppoDesc =
      "     Uygulamamız İçinde\n Kolay ve Hızlı Randevu Alın.".myLocale;

  static String getWhatsapp = "WHATSAPP  ".myLocale;
  static String getWhatsappDesc =
      " Bizimle Whatsapp Üzerinden\n     İletişime Geçin".myLocale;
}

extension LocaleExtension on String {
  String get myLocale => this.tr().toString();
}
