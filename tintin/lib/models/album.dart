import 'package:tintin/models/gps.dart';

class Album {
  String title;
  int numero;
  int year;
  int? yearInColor;
  String image;
  String resume;
  Gps gps;
  String location;

  Album({
    required this.title,
    required this.numero,
    required this.year,
    this.yearInColor,
    required this.image,
    required this.resume,
    required this.gps,
    required this.location,
  });

  @override
  String toString() {
    return 'Album {'
        'Title: $title, '
        'Number: $numero, '
        'Year: $year, '
        'Year In Color: ${yearInColor ?? ""}, ' 
        'Image: $image, '
        'Resume: $resume, '
        'GPS: $gps, '
        'Location: $location'
        '}';
  }

  Map<String, dynamic>toJson()=> {
    "numero": numero,
        "titre": title,
        "parution": year,
        "image": image,
        "parutionEnCouleur": yearInColor,
        "resume": resume,
        "lieu": location,
        "gps": gps.toJson(),
   };

  factory Album.fromJson(Map<String, dynamic> json) {
    List<String> gpsCoordinates = json['gps'].split(',');
  return Album(
    numero: json['numero'] as int,
    title: json['titre'] as String,
    year: json['parution'] as int,
    yearInColor: json['parutionEnCouleur'] != null ? json['parutionEnCouleur'] as int : null,
    image: json['image'] as String,
    resume: json['resume'] as String,
    gps: Gps(latitude: double.parse(gpsCoordinates[0]),
    longitude: double.parse(gpsCoordinates[1])),
    location: json['lieu'] as String,
  );
}

  
}

