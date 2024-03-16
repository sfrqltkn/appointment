import 'package:appointment/ui/compenents/galery_view_page/carousel_slider.dart';
import 'package:flutter/material.dart';

class GaleryViewPage extends StatefulWidget {
  const GaleryViewPage({super.key});

  @override
  State<GaleryViewPage> createState() => _GaleryViewState();
}

class _GaleryViewState extends State<GaleryViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beauty"),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 2),
              SliderText(textName: "Our Hair Designs"),
              SliderImage(imageName: "hair"),
              SizedBox(height: 50),
              SliderText(textName: " Make Up & Facial care\n             Wax"),
              SliderImage(imageName: "makeAndFace"),
              SizedBox(height: 50),
              SliderText(textName: "Eyelash & Nail\n      Eyebrow"),
              SliderImage(imageName: "eyelasyAndNail"),
              SizedBox(height: 50),
              SliderText(textName: "Beauty Products"),
              SliderImage(imageName: "product"),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
