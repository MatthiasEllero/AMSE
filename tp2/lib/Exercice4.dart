import 'package:flutter/material.dart';

class Tile {
  String imageURL = "";
  Alignment alignment = new Alignment(0,0);

  Tile(String url, Alignment align){
    this.imageURL = url;
    this.alignment = align;
  }

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Container(
          child: Align(
            alignment: this.alignment,
            widthFactor: 0.3,
            heightFactor: 0.3,
            child: Image.network(this.imageURL),
          ),
        ),
      ),
    );
  }
}

Tile tile = new Tile(
    'https://picsum.photos/512', Alignment(0, 0));

class Exercice4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display a Tile as a Cropped Image'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
                margin: EdgeInsets.all(20.0),
                child: this.createTileWidgetFrom(tile))),
        Container(
            height: 200,
            child: Image.network('https://picsum.photos/512',
                fit: BoxFit.cover))
      ])),
    );
  }

  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: tile.croppedImageTile(),
      onTap: () {
        print("tapped on tile");
      },
    );
  }
}