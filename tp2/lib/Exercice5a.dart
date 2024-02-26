import 'package:flutter/material.dart';

void main() {
  runApp(const Exercice5a());
}

class Exercice5a extends StatelessWidget {
  const Exercice5a({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plateau de Tuiles'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const TileGridView(),
    );
  }
}

class TileGridView extends StatelessWidget {
  const TileGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.0,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.blue[100 * ((index % 8) + 1)],
          child: Center(
            child: Text(
              'Tuile $index',
              style: const TextStyle(fontSize: 16),
            ),
          ),
        );
      },
    );
  }
}
