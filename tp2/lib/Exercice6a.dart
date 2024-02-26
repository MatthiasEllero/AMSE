import 'package:flutter/material.dart';
import 'dart:math' as math;

// ==============
// Models
// ==============

math.Random random = new math.Random();

class Tile {
  late Color color; // Marquage de `color` comme late

  Tile(this.color);
  Tile.randomColor() {
    this.color = Color.fromARGB(
        255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
  }
}

// ==============
// Widgets
// ==============

class TileWidget extends StatelessWidget {
  final Tile tile;

  TileWidget(this.tile);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: tile.color,
      child: Padding(
        padding: EdgeInsets.all(70.0),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: Exercice6a()));

class Exercice6a extends StatefulWidget {
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
        title: Text('Moving Tiles'),
        centerTitle: true,
      ),
      body: Row(children: tileWidgets),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.swap_horiz),
        onPressed: swapTiles,
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
