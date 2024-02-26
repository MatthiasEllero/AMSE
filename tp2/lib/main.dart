import 'package:flutter/material.dart';
import 'package:tp2/exercice1.dart';
import 'package:tp2/exercice2a.dart';
import 'package:tp2/exercice2b.dart';
import 'package:tp2/exercice4.dart';
import 'package:tp2/Exercice5a.dart';
import 'package:tp2/Exercice5b.dart';
import 'package:tp2/Exercice5c.dart';
import 'package:tp2/Exercice6a.dart';
import 'package:tp2/Exercice6b.dart';
import 'package:tp2/Exercice7.dart';

void main() {
  runApp(const Exercice3());
}

class Exercice3 extends StatelessWidget {
  const Exercice3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TP2',
      theme: ThemeData(
        primaryColor: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.blue, // Définir la couleur de la barre d'app en bleu
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/exercice1': (context) => const Exercice1(),
        '/exercice2a': (context) => const Exercice2a(),
        '/exercice2b': (context) => const Exercice2b(),
        '/exercice4': (context) => const Exercice4(),
        '/exercice5a': (context) => const Exercice5a(),
        '/exercice5b': (context) => const Exercice5b(),
        '/exercice5c': (context) => const Exercice5c(),
        '/exercice6a': (context) => const Exercice6a(),
        '/exercice6b': (context) => const Exercice6b(),
        '/exercice7': (context) => const Exercice7(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TP2 - Liste Exercice (Exercice 3)"),
      ),
      body: ListView(
        children: const <Widget>[
          CardItem(
              title: "Exercice 1",
              route: '/exercice1'), // Route vers Exercice 1
          CardItem(
              title: "Exercice 2a",
              route: '/exercice2a'), // Route vers Exercice 2a
          CardItem(
              title: "Exercice 2b",
              route: '/exercice2b'), // Route vers Exercice 2b
          CardItem(
              title: "Exercice 4",
              route: '/exercice4'), // Route vers Exercice 4
          CardItem(
              title: "Exercice 5a",
              route: '/exercice5a'), // Route vers Exercice 5a
          CardItem(title: "Exercice 5b", route: '/exercice5b'),
          CardItem(
              title: "Exercice 5c",
              route: '/exercice5c'), // Route vers Exercice 5c
          CardItem(
              title: "Exercice 6a",
              route: '/exercice6a'), // Route vers Exercice 6a
          CardItem(
              title: "Exercice 6b",
              route: '/exercice6b'), // Route vers Exercice 6b
          CardItem(
              title: "Exercice 7",
              route: '/exercice7'), // Route vers Exercice 7
        ],
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String route;

  const CardItem({super.key, required this.title, required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        onTap: () {
          Navigator.pushNamed(
              context, route); // Navigation vers la page correspondante
        },
        trailing: const Icon(
            Icons.play_arrow), // Ajouter une icône "play" à droite de la carte
      ),
    );
  }
}
