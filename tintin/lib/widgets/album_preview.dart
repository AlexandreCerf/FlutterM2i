import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;

  const AlbumPreview({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        album.title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      leading: album.image.isNotEmpty
          ? Image.network(
              album.image,
              fit: BoxFit.cover,
              width: 50, 
              height: 50,
            )
          : const Icon(
              Icons.album, 
              size: 50,
              color: Colors.grey,
            ),
    );
  }
}
