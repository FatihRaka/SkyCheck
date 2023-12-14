import 'package:flutter/material.dart';
import 'package:sky_check/pages/moscow_page.dart';
import 'package:sky_check/pages/weather_page.dart';
import 'package:sky_check/pages/tokyo_page.dart';
import 'package:sky_check/pages/london_page.dart';
import 'package:sky_check/pages/jakarta_page.dart';
import 'package:sky_check/pages/newyork_page.dart';
import 'package:sky_check/pages/paris_page.dart';
import 'package:sky_check/pages/berlin_page.dart';
import 'package:sky_check/pages/others_page.dart';  // Import halaman OthersPage


class OverviewPage extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  void navigateToOthersPage(BuildContext context, String cityName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OthersPage(cityName: cityName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Kotak Pencarian
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 30.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search for other cities...',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      navigateToOthersPage(context, searchController.text);
                    }
                  },
                  icon: Icon(Icons.search),
                ),
              ),
              onSubmitted: (String value) {
                if (value.isNotEmpty) {
                  navigateToOthersPage(context, value);
                }
              },
            ),
          ),
          // GridView untuk kota-kota
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              padding: EdgeInsets.all(16.0),
              children: [
                CityBox('Current City', Colors.blue, Colors.green, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WeatherPage(),
                    ),
                  );
                }),
                CityBox('London', Colors.orange, Colors.red, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LondonPage(),
                    ),
                  );
                }),
                CityBox('Tokyo', Colors.purple, Colors.pink, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TokyoPage(),
                    ),
                  );
                }),
                CityBox('Moscow', Colors.orange, Colors.blue, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoscowPage(),
                    ),
                  );
                }),
                CityBox('Jakarta', Colors.yellowAccent, Colors.orangeAccent, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => JakartaPage(),
                    ),
                  );
                }),
                CityBox('New York', Colors.deepPurpleAccent, Colors.deepOrangeAccent, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewYorkPage(),
                    ),
                  );
                }),
                CityBox('Paris', Colors.amber, Colors.tealAccent, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ParisPage(),
                    ),
                  );
                }),
                CityBox('Berlin', Colors.teal, Colors.deepPurpleAccent, () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BerlinPage(),
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CityBox extends StatelessWidget {
  final String cityName;
  final Color startColor;
  final Color endColor;
  final VoidCallback onTap;

  CityBox(this.cityName, this.startColor, this.endColor, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [startColor, endColor],
          ),
        ),
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(top: 16),
        child: Center(
          child: Text(
            cityName,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
