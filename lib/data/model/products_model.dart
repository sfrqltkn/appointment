class Products {
  String? id;
  String name;
  String url;
  String description;
  int price;

  Products(
      {this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.url});

  factory Products.fromJson(Map<dynamic, dynamic> json, String key) {
    return Products(
      id: key,
      name: json["name"] as String,
      description: json["description"] as String,
      url: json["url"] as String,
      price: json["price"] as int,
    );
  }
}
