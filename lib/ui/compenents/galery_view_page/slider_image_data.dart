class ImageData {
  List<String> hairImageURLs = [
    "https://i.imgur.com/AueYUx1.jpg",
    "https://i.imgur.com/PiK3b8R.jpg",
    "https://i.imgur.com/FqwOw8m.jpg",
    "https://i.imgur.com/vwCzTuF.jpg",
    "https://i.imgur.com/JoOKoOI.jpg",
  ];
  List<String> makeAndFaceImageURLs = [
    "https://i.imgur.com/ANdyKkS.jpg",
    "https://i.imgur.com/CRFTP4A.jpg",
    "https://i.imgur.com/1sAVpaZ.jpg",
    "https://i.imgur.com/frNfav7.jpg",
    "https://i.imgur.com/m9DGh45.jpg",
  ];

  List<String> eyelasyAndNailImageURLs = [
    "https://i.imgur.com/htzOLYD.jpg",
    "https://i.imgur.com/04tXDiS.jpg",
    "https://i.imgur.com/ZpzYQ5g.jpg",
    "https://i.imgur.com/Yj6DEBz.jpg",
    "https://i.imgur.com/DQalej8.jpg",
    "https://i.imgur.com/a7TKJgY.jpg",
  ];
  List<String> productImageURLs = [
    "https://i.imgur.com/rFxgEM7.png",
    "https://i.imgur.com/psJ9UG5.jpg",
    "https://i.imgur.com/3stGwHX.jpg",
    "https://i.imgur.com/vphPRRI.png",
    "https://i.imgur.com/cXfp2W1.jpg",
    "https://i.imgur.com/ZSmSmO3.png",
  ];

  int listLengthSelector(String imageTitle) {
    switch (imageTitle) {
      case "hair":
        return hairImageURLs.length;
      case "makeAndFace":
        return makeAndFaceImageURLs.length;
      case "eyelasyAndNail":
        return eyelasyAndNailImageURLs.length;
      case "product":
        return productImageURLs.length;
      default:
        print("i'nin değeri bilinmiyor.");
        return -1;
    }
  }

  List<String> listSelector(String imageTitle) {
    switch (imageTitle) {
      case "hair":
        return hairImageURLs;
      case "makeAndFace":
        return makeAndFaceImageURLs;
      case "eyelasyAndNail":
        return eyelasyAndNailImageURLs;
      case "product":
        return productImageURLs;
      default:
        print("i'nin değeri bilinmiyor.");
        return [];
    }
  }
}
