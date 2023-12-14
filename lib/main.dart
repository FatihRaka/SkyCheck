import 'package:flutter/material.dart';

import 'pages/weather_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      title: "SkyCheck",
      debugShowCheckedModeBanner: false,
      
      

      home: WeatherPage(),

      darkTheme: ThemeData.dark().copyWith(
        // Konfigurasi tema gelap
        primaryColor: Colors.teal, // Contoh perubahan warna primer pada mode gelap
        // Tambahkan konfigurasi tema gelap sesuai kebutuhan
      ),
      themeMode: ThemeMode.system,

      theme: ThemeData(
        textTheme: TextTheme(
          bodyText1: TextStyle(fontFamily: 'Poppins'),
          bodyText2: TextStyle(fontFamily: 'Poppins'),
          headline6: TextStyle(fontFamily: 'Poppins', fontSize: 20.0),
          // Tambahkan lebih banyak gaya teks sesuai kebutuhan
        ),
      ),
      
     );

     
  }
}