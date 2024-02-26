import 'package:flutter/material.dart';

class Tile {
  String imageURL = "";
  Alignment alignment = const Alignment(0, 0);

  Tile(String url, Alignment align) {
    imageURL = url;
    alignment = align;
  }

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Align(
          alignment: alignment,
          widthFactor: 0.2,
          heightFactor: 0.2,
          child: Image.network(imageURL),
        ),
      ),
    );
  }
}

Tile tile = Tile(
    'https://www.boutique-namaste.com/cdn/shop/articles/animal-totem-aigle_1600x.jpg?v=1670453691',
    const Alignment(-1, -1));

class Exercice4 extends StatelessWidget {
  const Exercice4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display a Tile as a Cropped Image'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
                margin: const EdgeInsets.all(20.0),
                child: createTileWidgetFrom(tile))),
        SizedBox(
            height: 200,
            child: Image.network(
                'https://www.boutique-namaste.com/cdn/shop/articles/animal-totem-aigle_1600x.jpg?v=1670453691',
                fit: BoxFit.cover))
      ])),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
    );
  }
}
