import 'package:flutter/material.dart';
import 'exercice4.dart';

class Exercice5b extends StatelessWidget {
  const Exercice5b({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plateau de Tuiles avec Image'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // Utilisation de Navigator.pop() pour revenir en arrière
            },
          ),
        ),
        body: const TileGridView(),
      ),
    );
  }
}

class TileGridView extends StatelessWidget {
  const TileGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.0,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: 16,
      itemBuilder: (context, index) {
        final int x = index % 4;
        final int y = index ~/ 4;

        final Alignment alignment =
            Alignment(-1.0 + (x * 0.5), -1.0 + (y * 0.5));

        final Tile tile = Tile(
          'https://www.boutique-namaste.com/cdn/shop/articles/animal-totem-aigle_1600x.jpg?v=1670453691',
          alignment,
        );

        return tile.croppedImageTile();
      },
    );
  }
}
