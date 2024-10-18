import 'package:flutter/material.dart';
import 'package:tintin/screens/albums_master.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AlbumsMaster',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AlbumsMaster(title: 'AlbumsMaster'),
    );
  }
}
