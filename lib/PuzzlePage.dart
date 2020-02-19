import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image/image.dart' as imglib;

class PuzzlePage extends StatelessWidget {
  final File image;
  PuzzlePage({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    imglib.Image img = imglib.decodeImage(image.readAsBytesSync());
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
        padding: EdgeInsets.all(10),
        crossAxisCount: 4,
        crossAxisSpacing: 20,
        mainAxisSpacing: 1,
        physics: ScrollPhysics(),
        children: splitImage(img, 6),
      ),
      )
    );
  }

  List<Image> splitImage(imglib.Image image, int part) {
    int x = 0, y = 0;
    // int width = (image.width / part).round();
    // int height = (image.height / part).round();

    int width = (image.width / part).round();
    int height = (image.width / part).round();

    // split image to parts
    List<imglib.Image> parts = List<imglib.Image>();
    for (int i = 0; i < part; i++) {
      for (int j = 0; j < part; j++) {
        parts.add(imglib.copyCrop(image, x, y, width, height));
        x += width;
      }
      x = 0;
      y += height;
    }

    // convert image from image package to Image Widget to display
    List<Image> output = List<Image>();
    for (var img in parts) {
      output.add(Image.memory(imglib.encodeJpg(img)));
    }

    return output;
  }
}
