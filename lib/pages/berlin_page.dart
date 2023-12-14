import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sky_check/models/weather_model.dart';
import 'package:sky_check/services/weather_service.dart';
import 'package:sky_check/pages/overview_page.dart';

class BerlinPage extends StatefulWidget {
  const BerlinPage({super.key});

  @override
  State<BerlinPage> createState() => _BerlinPageState();
}

class _BerlinPageState extends State<BerlinPage> {
  // api key
  final _weatherService = WeatherService('09e4b00758a22547ac5f075a87d7a8c4');
  Weather? _weather;

  // fetch weather
  _fetchWeather() async {
    // get the current city
    String cityName = "Berlin";

    // get weather for city
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // weather animations
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/sunny.json'; // default to sunny

    switch (mainCondition.toLowerCase()) {
      case 'clouds':
      case 'mist':
      case 'smoke':
      case 'haze':
      case 'dust':
      case 'fog':
        return 'assets/cloudy.json';
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return 'assets/rain.json';
      case 'thunderstorm':
        return 'assets/thunder.json';
      case 'clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  // init state
  @override
  void initState() {
    super.initState();

    // fetch weather on startup
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.teal, Colors.deepPurpleAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // city name
              Text(
                _weather?.cityName ?? "loading city..",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),

              // city time
              

              Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

              // temperature
              Text(
                '${_weather?.temperature.round()}°C',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),

              // weather condition
              Text(
                _weather?.mainCondition ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 10), // Tambahkan jarak 10 pixel

              Text(
                'Pressure: ${_weather?.pressure}hPa',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),

              Text(
                'Humidity: ${_weather?.humidity}%',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ), 
              
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OverviewPage(),
                    ),
                  );
                },
                child: Text('Other Cities'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
