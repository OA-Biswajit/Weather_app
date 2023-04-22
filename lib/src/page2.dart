import 'dart:convert';
import 'package:weather_app/src/model/weather_model.dart';
import 'package:weather_app/src/model/weather_model.dart';
import 'package:http/http.dart' as https;
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class page2 extends StatefulWidget {
  const page2({super.key});

  @override
  State<page2> createState() => _page2State();
}

class _page2State extends State<page2> {

  var locationLoading = false;
  @override
  void initState() {
    getLocationInfo();
    super.initState();
  }

  fetchWeatherInfo({double long = 86.42, double lat = 20.49}) async {
    var response = await https.post(
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=${lat.toString()}&lon=${long.toString()}&appid=30bc1dae9d219aaa107f75ba1682a80c"),
    );
    var decodedJson = await jsonDecode(response.body);
    late Weather_modal weather;
    weather = Weather_modal(
        main: decodedJson["weather"][0]["main"],
        description: decodedJson["weather"][0]["description"],
        country: decodedJson["sys"]["country"],
        icon: decodedJson["weather"][0]["icon"],
        name: decodedJson["name"],
        id: decodedJson["weather"][0]["id"],
        tempMax: decodedJson["main"]["temp_max"],
        tempMin: decodedJson["main"]["temp_min"],
        temp: decodedJson["main"]["temp"]);
  }

  void getLocationInfo() async {
    locationLoading = true;

    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);

    fetchWeatherInfo(long: position.longitude, lat: position.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Container(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        margin: const EdgeInsets.only(top: 20),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: Center(
                            child: Text(
                         Weather_modal.temp!,
                          style: const TextStyle(color: Colors.white),
                        )),
                      ),
               
    );
  }
}
