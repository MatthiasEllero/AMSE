import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(Exercice5c());
}

class Exercice5c extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class Tile {
  String imageURL = "";
  Alignment alignment = Alignment.center;
  double tileRatio;

  Tile(String url, Alignment align, {required this.tileRatio}) {
    this.imageURL = url;
    this.alignment = align;
  }

  Widget croppedImageTile(Size imageSize, int crossAxisCount, int index) {
    final double imageWidth = imageSize.width;
    final double imageHeight = imageSize.height;

    final double tileWidth = imageWidth / crossAxisCount;
    final double tileHeight = imageHeight / crossAxisCount;

    final int x = index % crossAxisCount; // Colonne
    final int y = index ~/ crossAxisCount; // Ligne

    final double offsetX = tileWidth * x;
    final double offsetY = tileHeight * y;

    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: Alignment(-1.0 + 2 * (offsetX / imageWidth), -1.0 + 2 * (offsetY / imageHeight)),
            widthFactor: tileWidth / imageWidth,
            heightFactor: tileHeight / imageHeight,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

class _MyAppState extends State<Exercice5c> {
  double _sliderValue = 4; // Commencez avec une grille 4x4

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Plateau de Tuiles Dynamique'),
        ),
        body: Column(
          children: [
            Expanded(
              child: TileGridView(crossAxisCount: _sliderValue.toInt()),
            ),
            Slider(
              min: 1,
              max: 8,
              divisions: 7,
              value: _sliderValue,
              label: '${_sliderValue.toInt()}',
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TileGridView extends StatelessWidget {
  final int crossAxisCount;

  TileGridView({required this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getImageSize(),
      builder: (context, AsyncSnapshot<Size> snapshot) {
        if (snapshot.hasData) {
          final imageSize = snapshot.data!;
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: 1.0,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
            ),
            itemCount: crossAxisCount * crossAxisCount,
            itemBuilder: (context, index) {
              final Tile tile = Tile(
                'https://as1.ftcdn.net/v2/jpg/01/41/12/10/1000_F_141121004_IpVWZBqHwvqIrMhJcohvDCM0D7S1NqkW.jpg',
                Alignment.center,
                tileRatio: 1 / crossAxisCount,
              );
              return tile.croppedImageTile(imageSize, crossAxisCount, index);
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Future<Size> _getImageSize() async {
    Completer<Size> completer = Completer();
    Image image = Image.network('https://as1.ftcdn.net/v2/jpg/01/41/12/10/1000_F_141121004_IpVWZBqHwvqIrMhJcohvDCM0D7S1NqkW.jpg');
    image.image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        completer.complete(Size(info.image.width.toDouble(), info.image.height.toDouble()));
      }),
    );
    return completer.future;
  }
}
