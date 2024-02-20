import 'package:flutter/material.dart';

void main() {
  runApp(Exercice5a());
}

class Exercice5a extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Plateau de Tuiles'),
        ),
        body: TileGridView(),
      ),
    );
  }
}

class TileGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Nombre de colonnes
        childAspectRatio: 1.0, // Ratio pour les tuiles carrées
        crossAxisSpacing: 4.0, // Espace horizontal entre les tuiles
        mainAxisSpacing: 4.0, // Espace vertical entre les tuiles
      ),
      itemCount: 12, // Nombre total de tuiles
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue[
              100 * ((index % 8) + 1)], // Couleur différente pour chaque tuile
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
