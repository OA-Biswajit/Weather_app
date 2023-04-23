import 'package:flutter/material.dart';
import 'package:weather_app/src/model/weather_model.dart';
import 'package:weather_app/src/page2.dart';
import 'package:weather_app/src/repo.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather_modal? weather_modal;
  final TextEditingController cityLocation = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      // backgroundColor: const Color.fromARGB(255, 240, 203, 215),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          'weather app',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        // backgroundColor: CupertinoColors.systemBackground,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Align(
          alignment: AlignmentDirectional.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: cityLocation,
                decoration: const InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                  hintText: "Enter city",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 98, 89, 57))
                ),
              ),
              // SizedBox(
              // height: 40,
              // width: 100,

              ElevatedButton(
                onPressed: () async {
                  repo().fetchWeatherInfo(cityLocation.text);
                  
                  setState(() {});
                
                
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const page2()));
                },
                child: const Text("Search"),
              ),
              // ),
            ],
          ),
        ),
      )),
    );
  }
}
