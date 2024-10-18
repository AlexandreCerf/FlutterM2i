import 'package:flutter/material.dart';
import 'package:tintin/services/album_service.dart';
import 'package:tintin/models/album.dart';
import 'album_details.dart';

class AlbumsMaster extends StatelessWidget {
  const AlbumsMaster({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder<List<Album>>(
        future: AlbumService.fetchAlbums(),
        builder: (BuildContext context, AsyncSnapshot<List<Album>> snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final album = snapshot.data![index];
                return Card(
                  child: SizedBox(
                    height: 60,
                    child: ListTile(
                        title: Text(album.title),
                        leading: Image.network(
                          'images/${album.image}',
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AlbumDetails(album: album),
                            ),
                          );
                        }),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text("No albums found."));
          }
        },
      ),
    );
  }
}
