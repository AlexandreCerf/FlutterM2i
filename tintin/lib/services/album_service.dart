import 'dart:async';
import 'dart:convert';
import 'package:faker/faker.dart';
import '../models/album.dart';
import '../models/gps.dart';
import 'package:flutter/services.dart' show rootBundle;

class AlbumService {
  static Future<List<Album>> generateAlbums() async {
    await Future.delayed(const Duration(seconds: 2));
    var faker = Faker();

    int currentYear = DateTime.now().year;

    return List.generate(10, (index) {
      return Album(
        title: faker.lorem.sentence(),
        numero: faker.randomGenerator.integer(24, min: 1),
        year: faker.randomGenerator.integer(currentYear, min: 1900),
        yearInColor: faker.randomGenerator.integer(currentYear, min: 1900),
        image: faker.image.loremPicsum(),
        resume: faker.lorem.sentence(),
        gps: Gps(
          latitude: faker.randomGenerator.decimal(min: -90, scale: 90),
          longitude: faker.randomGenerator.decimal(min: -180, scale: 180),
        ),
        location: faker.address.city(),
      );
    });
  }

  static Future<List<Album>> fetchAlbums() async {
    final String jsonString = await rootBundle.loadString('data/album.json');
    final List<dynamic> jsonData = jsonDecode(jsonString);

    List<Album> albums = jsonData.map((jsonItem) {
      return Album.fromJson(jsonItem as Map<String, dynamic>);
    }).toList();

    return albums;
  }
}
