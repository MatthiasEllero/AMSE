import 'package:flutter/material.dart';
import 'package:tp2/exercice1.dart'; // Import de Exercice_1.dart
import 'package:tp2/exercice2a.dart'; // Import de Exercice_2a.dart
import 'package:tp2/exercice2b.dart'; // Import de Exercice_2b.dart

void main() {
  runApp(Exercice3());
}

class Exercice3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TP2',
      theme: ThemeData(
        primaryColor: Colors.blue, // Définir la couleur principale de l'application en bleu
        appBarTheme: AppBarTheme(
          color: Colors.blue, // Définir la couleur de la barre d'app en bleu
        ),
      ),
      initialRoute: '/', // Route initiale
      routes: {
        '/': (context) => MyHomePage(), // Page d'accueil
        '/exercice1': (context) => Exercice1(), // Exercice 1
        '/exercice2a': (context) => Exercice2a(), // Exercice 2a
        '/exercice2b': (context) => Exercice2b(), // Exercice 2b
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TP2 - Liste Exercice (Exercice 3)"),
      ),
      body: ListView(
        children: <Widget>[
          CardItem(title: "Exercice 1", route: '/exercice1'), // Route vers Exercice 1
          CardItem(title: "Exercice 2a", route: '/exercice2a'), // Route vers Exercice 2a
          CardItem(title: "Exercice 2b", route: '/exercice2b'), // Route vers Exercice 2b
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String route;

  CardItem({required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        onTap: () {
          Navigator.pushNamed(context, route); // Navigation vers la page correspondante
        },
        trailing: Icon(Icons.play_arrow), // Ajouter une icône "play" à droite de la carte
      ),
    );
  }
}
