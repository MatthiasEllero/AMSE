import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key})
      : super(key: key); // Ajout du constructeur const avec super.key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'About Us - AMSE TV'), // Modification du titre pour plus de spécificité
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'About us',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight
                      .bold), // Ajustement de la taille de police pour correspondre à HomePage
            ),
            SizedBox(height: 20), // Augmentation de l'espace après le titre
            Text(
              'At Amse TV, we\'re passionate about bringing you the richest selection of films, series, and mangas from around the globe. Our mission is to provide easy access to a world of stories, where every user can find something that resonates.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Our mission is to make diverse and compelling multimedia content accessible to everyone, anywhere, anytime. We envision a world where stories transcend borders, fostering understanding and connection across cultures.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Our team is made up of passionate students, working tirelessly to curate and bring you the best content.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'We love hearing from you!',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight
                      .bold), // Ajustement de la taille de police pour correspondre à HomePage
            ),
            SizedBox(height: 20),
            Text(
              'For support, feedback, or inquiries, please contact us at:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            SelectableText(
              'achraf.ouhadach@etu.imt-nord-europe.fr',
              style: TextStyle(fontSize: 16, color: Colors.blue),
              // Vous pouvez ajouter du code ici pour implémenter la fonction de copie ou d'ouverture de l'application de messagerie
            ),
            SizedBox(height: 10), // Ajout d'un espace entre les adresses e-mail
            SelectableText(
              'matthias.ellero@etu.imt-nord-europe.fr',
              style: TextStyle(fontSize: 16, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
