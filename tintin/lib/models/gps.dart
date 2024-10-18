class Gps{
  final double? latitude;
  final double? longitude;

  Gps({required this.latitude, required this.longitude});

   Map<String, dynamic> toJson() => {
    'latitude': latitude,
    'longitude': longitude,
  };

  factory Gps.fromJson(Map<String, dynamic> json) {
    return Gps(
      latitude: json['latitude'] as double,
      longitude: json['longitude'] as double,
    );
  }
}