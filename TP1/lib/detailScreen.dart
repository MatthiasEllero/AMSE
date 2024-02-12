import 'package:flutter/material.dart';
import 'media.dart';

class DetailScreen extends StatefulWidget {
  final Media media;

  const DetailScreen({Key? key, required this.media}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.media.name),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage(widget.media.image_url),
                fit: BoxFit.cover,
              ),
              SizedBox(height: 16.0),
              Center(
                child: Text(
                  'Nom: ${widget.media.name}',
                  style: TextStyle(fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: Text(
                  'Date: ${widget.media.date}',
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 16.0),
              Center(child:IconButton(
                icon: Icon(
                  widget.media.favorite ? Icons.favorite : Icons.favorite_border,
                  color: widget.media.favorite ? Colors.red : null,
                  size: 50,
                ),
                onPressed: () {
                  setState(() {
                    widget.media.favorite = !widget.media.favorite;
                  });
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}