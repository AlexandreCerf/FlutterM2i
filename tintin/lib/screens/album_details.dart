import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';

class AlbumDetails extends StatelessWidget {
  final Album album;

  const AlbumDetails({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: (AppBar(
          title: Text(album.title),
          backgroundColor: Colors.yellow,
          centerTitle: true,
        )),
        body: Center(
          child: Column(
            children: [
              Text('Album n° ${album.numero}'),
              Text('Résumé : ${album.resume}'),
              Text('Année de parution : ${album.year}'),
              Image.network(
                'images/${album.image}',
                height: 400,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ));
  }
}
