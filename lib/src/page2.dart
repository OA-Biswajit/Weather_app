import 'package:weather_app/src/model/weather_model.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/src/repo.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {
  Weather_modal? weather_modal;
  // late Weather_modal weather;
  // Weather_modal? weather_modal;

  bool loading = true;
  var locationLoading = false;
  @override

  // weather = Weather_modal(
  //     main: decodedJson["weather"][0]["main"],
  //     description: decodedJson["weather"][0]["description"],
  //     country: decodedJson["sys"]["country"],
  //     icon: decodedJson["weather"][0]["icon"],
  //     name: decodedJson["name"],
  //     id: decodedJson["weather"][0]["id"],
  //     tempMax: decodedJson["main"]["temp_max"],
  //     tempMin: decodedJson["main"]["temp_min"],
  //     temp: decodedJson["main"]["temp"]);

  // void getLocationInfo() async {
  //   locationLoading = true;

  //   await Geolocator.checkPermission();
  //   await Geolocator.requestPermission();

  //   Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.low);

  //   fetchWeatherInfo(long: position.longitude, lat: position.latitude);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
        Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      icon,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Text(
                      "${(weather_modal?.temp! - 275)}°",
                      style: TextStyle(
                          fontSize: 130,
                          fontStyle: FontStyle.normal,
                          color: weatherAccentColor),
                    ),
                    Text(
                      "${(weather_modal.temp_max - 275)} °C",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          
                    ),
                    const SizedBox(width: 20),
                    
                    const SizedBox(width: 10),
                    Text(
                      '${(weather_modal.temp_min - 275).truncate()} °C',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 39, 55, 96)),
                    ),
                  ],
                ),
    ),
    );
  }
}
