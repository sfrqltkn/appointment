class Products {
  String id;
  String ad;
  String resim;
  int fiyat;
  String toplam;
  Products(
      {required this.id,
      required this.fiyat,
      required this.resim,
      required this.ad,
      required this.toplam});

  factory Products.fromJson(Map<dynamic, dynamic> json, String key) {
    return Products(
        id: key,
        /*key= "ad" olacak ve onun karşılığı olan value="dynamic" karşılık gelen değeri string türüne pars et demek*/
        ad: json["ad"] as String,
        resim: json["resim"] as String,
        fiyat: json["fiyat"] as int,
        toplam: json["toplam"] as String);
  }
}
