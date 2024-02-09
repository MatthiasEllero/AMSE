import "package:flutter/material.dart";
import 'media.dart';

class MediaPage extends StatelessWidget {
    const MediaPage({super.key});
    @override
    Widget build(BuildContext context) {
        return(
            ListView.builder(
                itemCount: listeMedia.length,
                itemBuilder: (BuildContext context, int index) {
                    return Card(child: ListTile(
                        leading: Image(image: NetworkImage(listeMedia[index].image_url)),
                        trailing: Text(listeMedia[index].name))
                    );
                }
            )
        );
    }
}