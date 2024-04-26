import 'package:appointment/utils/enums/constant.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class TextData {
  String testContent;
  String buttonName;
  String imagePath;
  TextData(
      {required this.testContent,
      required this.buttonName,
      required this.imagePath});
}

class OperationsPerformed extends StatelessWidget {
  const OperationsPerformed({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    List<TextData> content = [
      TextData(
        testContent: LocaleConstants.hairOperations,
        buttonName: LocaleConstants.hairDesign,
        imagePath: "assets/images/sactasarim.jpg",
      ),
      TextData(
        testContent: LocaleConstants.careOperations,
        buttonName: LocaleConstants.care,
        imagePath: "assets/images/care.jpg",
      ),
      TextData(
        testContent: LocaleConstants.beautyOperations,
        buttonName: LocaleConstants.appBar,
        imagePath: "assets/images/beauty.png",
      ),
      TextData(
        testContent: LocaleConstants.productsOperations,
        buttonName: LocaleConstants.products,
        imagePath: "assets/images/products.png",
      ),
    ];
    return Expanded(
      child: Column(
        children: [
          Image.asset(
            content[index].imagePath,
            width: 170,
            height: 230,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 3),
          SizedBox(
            width: 159,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: HexColor("#ffffff"),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              content[index].buttonName,
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.8),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.close,
                                color: HexColor("#000000"),
                                size: 28,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        content: SingleChildScrollView(
                            child: ListBody(
                          children: [
                            Text(
                              content[index].testContent,
                              style: const TextStyle(
                                  fontSize: 18, letterSpacing: 1.8),
                            ),
                          ],
                        )),
                      );
                    });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: HexColor("#A87766"),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              child: Text(
                content[index].buttonName,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.3),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
