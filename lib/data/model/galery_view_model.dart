class Galery {
  String url1;
  String url2;
  String url3;
  String url4;
  String url5;
  String url6;

  Galery(
      {required this.url1,
      required this.url2,
      required this.url3,
      required this.url4,
      required this.url5,
      required this.url6});

  factory Galery.fromJson(Map<dynamic, dynamic> json) {
    return Galery(
        url1: json["url1"] as String,
        url2: json["url2"] as String,
        url3: json["url3"] as String,
        url4: json["url4"] as String,
        url5: json["url5"] as String,
        url6: json["url6"] as String);
  }
}
