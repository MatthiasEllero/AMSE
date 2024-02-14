import 'package:flutter/material.dart';

class Exercice1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Affichage d\'une Image'),
      ),
      body: Center(
        // Utilisez Image.network pour charger une image depuis une URL
        child: Image.network('https://www.boutique-namaste.com/cdn/shop/articles/animal-totem-aigle_1600x.jpg?v=1670453691'),
      ),
    );
  }
}
