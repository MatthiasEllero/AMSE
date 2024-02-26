import 'package:flutter/material.dart';
import 'dart:math' as math;

math.Random random = new math.Random();

class Tile {
  String imageURL;
  Alignment alignment;
  double? ratio;

  Tile(this.imageURL, this.alignment, this.ratio);

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: alignment,
            widthFactor: ratio,
            heightFactor: ratio,
            child: Image.network(imageURL),
          ),
        ),
      ),
    );
  }
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
        child: tile.croppedImageTile(),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: Exercice7()));

class Exercice7 extends StatefulWidget {
  @override
  _Exercice7State createState() => _Exercice7State();
}

class _Exercice7State extends State<Exercice7> {
  late List<List<Tile>> grid;
  late List<List<Tile>> initialGrid;
  int gridSize = 3;
  double sliderValue = 3.0;
  bool isGameStarted = false;
  bool isPuzzleSolvedOnce = false;

  void initGrid() {
    int emptyX = 0;
    int emptyY = 0;

    grid = List.generate(
      gridSize,
      (i) => List.generate(
        gridSize,
        (j) {
          final int x = j;
          final int y = i;
          final double ratio = 1 / gridSize;
          final Alignment alignment = Alignment(
            -1.0 + 1 / (gridSize) + 2 * y * ratio,
            -1.0 + 1 / (gridSize) + 2 * x * ratio,
          );
          if (i == emptyY && j == emptyX) {
            return Tile('', Alignment.center, 0);
          } else {
            return Tile(
                'https://as1.ftcdn.net/v2/jpg/01/41/12/10/1000_F_141121004_IpVWZBqHwvqIrMhJcohvDCM0D7S1NqkW.jpg',
                alignment,
                1 / (gridSize + 1));
          }
        },
      ),
    );
    initialGrid = List.generate(gridSize, (i) => List.from(grid[i]));

  }

  @override
  void initState() {
    super.initState();
    initGrid();
  }

  void shuffleTiles() {
    isGameStarted = false;
    for (int i = 0; i < 1000; i++) {
      int x = random.nextInt(gridSize);
      int y = random.nextInt(gridSize);
      moveTile(x, y);
    }
    isGameStarted = true;
  }

  bool isPuzzleSolved() {
    for (int i = 0; i < gridSize; i++) {
      for (int j = 0; j < gridSize; j++) {
        if (grid[i][j].imageURL != initialGrid[i][j].imageURL ||
            grid[i][j].alignment != initialGrid[i][j].alignment ||
            grid[i][j].ratio != initialGrid[i][j].ratio) {
          return false;
        }
      }
    }
    return true;
  }

  void moveTile(int x, int y) {
    if (!grid[x][y].imageURL.isEmpty) {
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
            grid[newX][newY].imageURL.isEmpty) {
          setState(() {
            grid[newX][newY] = grid[x][y];
            grid[x][y] = Tile('', Alignment.center, 0);
          });
          break;
        }
      }
    }

    if (isGameStarted && isPuzzleSolved()) {
        isGameStarted = false;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Félicitations !'),
              content: Text('Vous avez résolu le taquin !'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Taquin'),
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
                int x = index % gridSize, y = index ~/ gridSize;
                return TileWidget(
                  tile: grid[x][y],
                  onTap: () {
                    if (isGameStarted) moveTile(x, y);
                  },
                );
              },
            ),
          ),
          if (!isGameStarted)
            Slider(
              min: 2,
              max: 8,
              divisions: 6,
              value: sliderValue,
              label: '${sliderValue.toInt()}x${sliderValue.toInt()}',
              onChanged: (double newValue) {
                setState(() {
                  sliderValue = newValue;
                  gridSize = newValue.toInt();
                  initGrid();
                });
              },
            ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (isGameStarted) {
                  // Arrêter le jeu
                  isGameStarted = false;
                  initGrid();
                } else {
                  // Démarrer le jeu
                  shuffleTiles();
                }
              });
            },
            child: Text(isGameStarted ? 'Stop' : 'Start'),
          ),
        ],
      ),
    );
  }
}