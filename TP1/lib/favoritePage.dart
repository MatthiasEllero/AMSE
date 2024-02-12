import 'package:flutter/material.dart';
import 'media.dart';
import 'detailScreen.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  String _selectedGenre = 'All'; 

  @override
  Widget build(BuildContext context) {
    List<Media> favoriteMedia = listeMedia.where((media) => media.favorite).toList();
    List<Media> filteredFavorites = _selectedGenre == 'All'
        ? favoriteMedia
        : favoriteMedia.where((media) => media.genre == _selectedGenre).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite List'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: _selectedGenre,
            onChanged: (String? newValue) {
              setState(() {
                _selectedGenre = newValue!;
              });
            },
            items: ['All', 'Film', 'Manga', 'Series'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredFavorites.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(media: filteredFavorites[index]),
                      ),
                    );
                  },
                  child: Card(
                    child: ListTile(
                      contentPadding: EdgeInsets.all(8.0),
                      leading: Container(
                        width: 100.0,
                        height: 150.0,
                        child: Image(
                          image: NetworkImage(filteredFavorites[index].image_url),
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(filteredFavorites[index].name),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
