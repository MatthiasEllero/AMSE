import 'package:flutter/material.dart';

void main() {
  runApp(Exercice5c());
}

class Exercice5c extends StatefulWidget {
  const Exercice5c({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Exercice5c> {
  double _sliderValue = 4;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plateau de Tuiles Dynamique'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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

class Tile {
  String imageURL = "";
  Alignment alignment = const Alignment(0, 0);
  double? ratio;

  Tile(String url, Alignment align, double ratio) {
    imageURL = url;
    alignment = align;
    ratio = ratio;
  }

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Align(
          alignment: alignment,
          widthFactor: ratio,
          heightFactor: ratio,
          child: Image.network(imageURL),
        ),
      ),
    );
  }
}

class TileGridView extends StatelessWidget {
  final int crossAxisCount;

  const TileGridView({super.key, required this.crossAxisCount});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 1.0,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
        ),
        itemCount: crossAxisCount * crossAxisCount,
        itemBuilder: (context, index) {
          final int x = index % crossAxisCount;
          final int y = index ~/ crossAxisCount;
          double ratio = 1 / crossAxisCount;

          final Alignment alignment = Alignment(
              -1.0 + 1 / (crossAxisCount) + 2 * x * ratio,
              -1.0 + 1 / (crossAxisCount) + 2 * y * ratio);

          final Tile tile = Tile(
              'https://as1.ftcdn.net/v2/jpg/01/41/12/10/1000_F_141121004_IpVWZBqHwvqIrMhJcohvDCM0D7S1NqkW.jpg',
              alignment,
              1 / (crossAxisCount + 1));

          return tile.croppedImageTile();
        });
  }
}
