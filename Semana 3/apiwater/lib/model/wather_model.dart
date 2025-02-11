class Wather {
  final String cityName;
  final double temperature;
  final String mainCodition;

  Wather({
    required this.cityName, 
    required this.temperature, 
    required this.mainCodition
  });

  factory Wather.fromJson(Map<String, dynamic> json) {
    return Wather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCodition: json['weather'][0]['main'],
    );
  }
}
