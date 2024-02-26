import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = math.Random();

class Tile {
  late Color color;

  Tile(this.color);
  Tile.randomColor() {
    color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}

class TileWidget extends StatelessWidget {
  final Tile tile;

  const TileWidget(this.tile, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: tile.color,
      child: const Padding(
        padding: EdgeInsets.all(70.0),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: Exercice6a()));

class Exercice6a extends StatefulWidget {
  const Exercice6a({super.key});

  @override
  PositionedTilesState createState() => PositionedTilesState();
}

class PositionedTilesState extends State<Exercice6a> {
  List<Tile> tileList = List<Tile>.generate(2, (_) => Tile.randomColor());

  @override
  Widget build(BuildContext context) {
    List<Widget> tileWidgets =
        tileList.map((tile) => TileWidget(tile)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Moving Tiles'),
        centerTitle: true,
      ),
      body: Row(children: tileWidgets),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }

  void swapTiles() {
    setState(() {
      Tile temp = tileList[0];
      tileList[0] = tileList[1];
      tileList[1] = temp;
    });
  }
}
