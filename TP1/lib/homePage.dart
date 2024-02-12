import "package:flutter/material.dart";

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding:
            const EdgeInsets.all(16.0), 
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, 
          children: <Widget>[
            const Text(
              'Welcome to AMSE TV, Your Ultimate Multimedia Companion!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold, 
              ),
            ),
            const SizedBox(height: 20),
            Image.network(
              'https://play-lh.googleusercontent.com/ZwNZF0FGnDrBK-OPoc5rcOMtb-q-SbwsupUpXVTroYdoXtD2BbtUCo-05B0c0gYgK6M', // Remplacez par votre URL d'image
              width: double
                  .infinity,
              height:
                  200,
              fit: BoxFit
                  .cover, 
            ),
            const SizedBox(height: 20),
            const Text(
              'Dive into a vast sea of films, series, and mangas right at your fingertips. Explore the latest releases, timeless classics, and hidden gems tailored just for you. Whether you\'re in the mood for an epic adventure, a heartwarming story, or a thrilling mystery, your next favorite is just a tap away.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'What’s New?',
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
                height: 10), 
            const Text(
              'Discover what\'s trending, recent additions, and our top picks for you this week.',
              style: TextStyle(
                fontSize: 16, 
              ),
            ),
            const SizedBox(
                height: 20), 
            const Text(
              'Explore Genres',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'From action-packed adventures to serene slice-of-life narratives, find content that matches your mood.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Your Favorites Await',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Quick access to your Liked Multimedia. It\'s like we know you better than you know yourself.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Start Your Journey',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Browse, discover, and enjoy. Welcome to a world where your next adventure is always ready to begin.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
  }
}
