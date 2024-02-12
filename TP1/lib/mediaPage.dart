import "package:flutter/material.dart";
import 'media.dart';
import 'detailScreen.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({Key? key}) : super(key: key);

  @override
  _MediaPageState createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  String _selectedGenre = 'All'; 

  @override
  Widget build(BuildContext context) {
    List<Media> filteredMedia = _selectedGenre == 'All'
        ? listeMedia
        : listeMedia.where((media) => media.genre == _selectedGenre).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Media List'),
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
              itemCount: filteredMedia.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(media: filteredMedia[index]),
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
                          image: NetworkImage(filteredMedia[index].image_url),
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(filteredMedia[index].name),
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

