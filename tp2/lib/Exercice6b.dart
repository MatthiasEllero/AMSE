import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = new math.Random();

class Tile {
  Color? color;
  bool isEmpty;

  Tile.randomColor()
      : color = Color.fromARGB(
            255, random.nextInt(255), random.nextInt(255), random.nextInt(255)),
        isEmpty = false;

  Tile.empty()
      : color = null,
        isEmpty = true;
}

class TileWidget extends StatelessWidget {
  final Tile tile;
  final VoidCallback onTap;

  TileWidget({required this.tile, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(4),
        color: tile.isEmpty ? Colors.white : tile.color,
        child: Padding(
          padding: EdgeInsets.all(20), // Ajusté pour des tuiles plus petites
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: Exercice6b()));

class Exercice6b extends StatefulWidget {
  @override
  PositionedTilesState createState() => PositionedTilesState();
}

class PositionedTilesState extends State<Exercice6b> {
  late List<List<Tile>> grid;
  int gridSize = 2; // Taille initiale de la grille
  double sliderValue = 2.0;

  void initGrid() {
    int emptyX = gridSize - 1;
    int emptyY = gridSize - 1;

    grid = List.generate(
        gridSize,
        (i) => List.generate(
            gridSize,
            (j) => i == emptyX && j == emptyY
                ? Tile.empty()
                : Tile.randomColor()));
  }

  @override
  void initState() {
    super.initState();
    initGrid();
  }

  void moveTile(int x, int y) {
    if (!grid[x][y].isEmpty) {
      List<List<int>> deltas = [
        [-1, 0],
        [1, 0],
        [0, -1],
        [0, 1]
      ];
      for (var delta in deltas) {
        int newX = x + delta[0];
        int newY = y + delta[1];
        if (newX >= 0 &&
            newX < gridSize &&
            newY >= 0 &&
            newY < gridSize &&
            grid[newX][newY].isEmpty) {
          setState(() {
            grid[newX][newY] = grid[x][y];
            grid[x][y] = Tile.empty();
          });
          break;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliding Puzzle'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridSize,
              ),
              itemCount: gridSize * gridSize,
              itemBuilder: (BuildContext context, int index) {
                int x = index ~/ gridSize, y = index % gridSize;
                return TileWidget(
                  tile: grid[x][y],
                  onTap: () => moveTile(x, y),
                );
              },
            ),
          ),
          Slider(
            min: 2,
            max: 8, // 5 pour 6x5, ajusté pour permettre des valeurs discrètes
            divisions: 6,
            value: sliderValue,
            label: '${sliderValue.toInt()}x${sliderValue.toInt()}',
            onChanged: (double newValue) {
              setState(() {
                sliderValue = newValue;
                gridSize = newValue.toInt(); // Convertir en taille de grille
                initGrid(); // Réinitialiser la grille avec la nouvelle taille
              });
            },
          ),
        ],
      ),
    );
  }
}