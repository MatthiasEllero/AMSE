import 'package:flutter/material.dart';

void main() {
  runApp(Exercice5a());
}

class Exercice5a extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plateau de Tuiles'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Utilisation de Navigator.pop() pour revenir en arrière
          },
        ),
      ),
      body: TileGridView(),
    );
  }
}


class TileGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, 
        childAspectRatio: 1.0, 
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0, 
      ),
      itemCount: 12, 
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue[
              100 * ((index % 8) + 1)], 
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
