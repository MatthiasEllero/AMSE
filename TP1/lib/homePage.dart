import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AMSE TV'),
      ),
      body: SingleChildScrollView(
        // Permet le défilement
        padding: EdgeInsets.all(16.0), // Ajoute un padding autour du contenu
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Alignement du texte au début
          children: <Widget>[
            Text(
              'Welcome to AMSE TV, Your Ultimate Multimedia Companion!',
              style: TextStyle(
                fontSize: 24, // Taille de police pour le titre
                fontWeight: FontWeight.bold, // Police en gras pour le titre
              ),
            ),
            SizedBox(height: 20), // Espace entre le titre et l'image
            Image.network(
              'https://play-lh.googleusercontent.com/ZwNZF0FGnDrBK-OPoc5rcOMtb-q-SbwsupUpXVTroYdoXtD2BbtUCo-05B0c0gYgK6M', // Remplacez par votre URL d'image
              width: double
                  .infinity, // La largeur de l'image correspond à la largeur du conteneur
              height:
                  200, // Hauteur fixe pour l'image (ajustez selon le besoin)
              fit: BoxFit
                  .cover, // Couvre l'espace alloué complètement, en coupant l'image si nécessaire
            ),
            SizedBox(height: 20), // Espace entre l'image et le texte
            Text(
              'Dive into a vast sea of films, series, and mangas right at your fingertips. Explore the latest releases, timeless classics, and hidden gems tailored just for you. Whether you\'re in the mood for an epic adventure, a heartwarming story, or a thrilling mystery, your next favorite is just a tap away.',
              style: TextStyle(
                fontSize: 16, // Taille de police pour le texte
              ),
            ),
            SizedBox(height: 20), // Espace avant "What’s New?"
            Text(
              'What’s New?',
              style: TextStyle(
                fontSize: 20, // Taille de police pour les titres de section
                fontWeight: FontWeight.bold, // Titres de section en gras
              ),
            ),
            SizedBox(height: 10), // Espace avant la description de la section
            Text(
              'Discover what\'s trending, recent additions, and our top picks for you this week.',
              style: TextStyle(
                fontSize: 16, // Taille de police pour le texte
              ),
            ),
            SizedBox(height: 20), // Ajoutez un espace avant "Explore Genres"
            Text(
              'Explore Genres',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'From action-packed adventures to serene slice-of-life narratives, find content that matches your mood.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your Favorites Await',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Quick access to your Liked Multimedia. It\'s like we know you better than you know yourself.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Start Your Journey',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Browse, discover, and enjoy. Welcome to a world where your next adventure is always ready to begin.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
