class Weather {
  final String cityName;
  final int time;
  final int pressure;
  final int humidity;
  final double temperature;
  final String mainCondition;
  
  Weather({
     required this.cityName,
     required this.time,
     required this.temperature,
     required this.pressure,
     required this.humidity,
     required this.mainCondition,
  });

   factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
    cityName: json['name'],
    time: json['timezone'], 
    temperature: json['main']['temp'].toDouble(),
    pressure: json['main']['pressure'],
    humidity: json['main']['humidity'],
    mainCondition: json['weather'][0]['main'],
    );
  }
}