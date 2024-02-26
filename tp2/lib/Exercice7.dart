import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;

math.Random random = math.Random();

class Tile {
  String imageURL;
  Alignment alignment;
  double? ratio;

  Tile(this.imageURL, this.alignment, this.ratio);

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

class TileWidget extends StatelessWidget {
  final Tile tile;
  final VoidCallback onTap;

  const TileWidget({super.key, required this.tile, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        child: tile.croppedImageTile(),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(home: Exercice7()));

class Exercice7 extends StatefulWidget {
  const Exercice7({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Exercice7State createState() => _Exercice7State();
}

class _Exercice7State extends State<Exercice7> {
  late List<List<Tile>> grid;
  late List<List<Tile>> initialGrid;
  int gridSize = 3;
  double sliderValue = 3.0;
  bool isGameStarted = false;
  bool isPuzzleSolvedOnce = false;
  int moveCount = 0;
  late Timer _timer;
  int _seconds = 0;
  List<List<int>> moveHistory = [];
  int emptyX = 0;
  int emptyY = 0;

  List<String> imageUrls = [
    'assets/avion.jpg',
    'assets/bateau.jpg',
    'assets/image1.jpg',
    'assets/IMT.jpg',
    'assets/Lille.jpg',
    'assets/mbappé.jpg',
    'assets/monalisa.jpg',
    'assets/Pisetour.jpg',
    'assets/toureifeel.jpg',
    'assets/voiture.jpg',
  ];
  int currentImageIndex = 0;
  String originalImageURL = 'assets/avion.jpg';

  void initGrid() {
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
            return Tile(originalImageURL, alignment, 1 / (gridSize + 1));
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
    moveHistory.clear();
    for (int i = 0; i < 1000; i++) {
      int x = random.nextInt(gridSize);
      int y = random.nextInt(gridSize);
      moveTile(x, y, addToHistory: false);
    }
    isGameStarted = true;
    startTimer();
    moveCount = 0;
    _seconds = 0;
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }

  void stopTimer() {
    _timer.cancel();
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

  void moveTile(int x, int y, {bool addToHistory = true}) {
    if (grid[x][y].imageURL.isNotEmpty) {
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
            if (addToHistory) {
              moveHistory.add([newX, newY]);
            }
            grid[newX][newY] = grid[x][y];
            grid[x][y] = Tile('', Alignment.center, 0);
            if (addToHistory) {
              moveCount++;
            } else {
              moveCount--;
            }
          });
          break;
        }
      }
    }

    if (isGameStarted && isPuzzleSolved()) {
      isGameStarted = false;
      stopTimer();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Félicitations !'),
            content: Text(
                'Vous avez résolu le taquin en $moveCount déplacements et en $_seconds secondes !'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void showOriginalImage() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Image.network(originalImageURL),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Fermer'),
          ),
        ],
      ),
    );
  }

  void changeImage(int delta) {
    currentImageIndex += delta;
    if (currentImageIndex < 0) {
      currentImageIndex = imageUrls.length - 1;
    } else if (currentImageIndex >= imageUrls.length) {
      currentImageIndex = 0;
    }
    originalImageURL = imageUrls[currentImageIndex];
    setState(() {
      initGrid();
      moveCount = 0;
      _seconds = 0;
    });
  }

  void undoMove() {
    if (moveHistory.isNotEmpty) {
      final lastMove = moveHistory.removeLast();
      final x = lastMove[0];
      final y = lastMove[1];
      setState(() {
        grid[x][y] = grid[emptyX][emptyY];
        grid[emptyX][emptyY] = Tile('', Alignment.center, 0);
      });
      moveCount--; // Décrémenter le compteur de déplacements
    }
    if (moveCount < 0) {
      moveCount = 0; // Assurer que le compteur ne devienne pas négatif
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taquin'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: showOriginalImage,
          ),
        ],
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
                    if (isGameStarted) {
                      moveTile(x, y);
                    }
                  },
                );
              },
            ),
          ),
          Visibility(
            visible: !isGameStarted,
            child: IconButton(
              icon: const Icon(Icons.casino),
              iconSize: 60,
              onPressed: () {
                originalImageURL =
                    'https://picsum.photos/512?random=${DateTime.now().millisecondsSinceEpoch}';
                setState(() {
                  initGrid();
                });
              },
            ),
          ),
          Text(
            'Déplacements: $moveCount',
            style: const TextStyle(fontSize: 20),
          ),
          Text(
            'Temps : $_seconds secondes',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(bottom: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 60,
                  onPressed: () {
                    changeImage(-1);
                  },
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      if (isGameStarted) {
                        isGameStarted = false;
                        initGrid();
                        moveCount = 0;
                        _seconds = 0;
                        moveHistory.clear();
                        stopTimer();
                      } else {
                        shuffleTiles();
                      }
                    });
                  },
                  icon: Icon(isGameStarted ? Icons.stop : Icons.play_arrow),
                  label: Text(isGameStarted ? 'Stop' : 'Start',
                      style: const TextStyle(fontSize: 30)),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  iconSize: 60,
                  onPressed: () {
                    changeImage(1);
                  },
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
          Visibility(
            visible: isGameStarted,
            child: ElevatedButton.icon(
              onPressed: undoMove,
              icon: const Icon(Icons.undo),
              label: const Text('Undo'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
          ),
          Visibility(
            visible: !isGameStarted,
            child: Slider(
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
          )
        ],
      ),
    );
  }
}
