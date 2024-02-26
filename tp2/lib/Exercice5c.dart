import 'package:flutter/material.dart';

void main() {
  runApp(Exercice5c());
}

class Exercice5c extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Exercice5c> {
  double _sliderValue = 4; // Commencez avec une grille 4x4

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Plateau de Tuiles Dynamique'),
          leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Utilisation de Navigator.pop() pour revenir en arrière
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
              divisions:
                  7, // Pour permettre de sélectionner des valeurs entières uniquement
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
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1.0,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount:
          crossAxisCount * crossAxisCount, // La grille sera toujours carrée
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue[100 * ((index % 8) + 1)],
          child: Center(
            child: Text(
              'Tuile $index',
              style: TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}
