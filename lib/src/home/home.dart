import 'package:weather_app/src/model/weather_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as https;
import 'package:weather_app/src/model/weather_model.dart';
import 'package:weather_app/src/page2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cityLocation = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 240, 203, 215),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'weather app',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        // backgroundColor: CupertinoColors.systemBackground,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 250,
            ),
            TextField(
              controller: cityLocation,
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                hintText: "Enter city",
                // hintStyle: TextStyle(color: Color.fromARGB(255, 98, 89, 57))
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 40,
              width: 100,
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => page2()));
                  Icon(Icons.my_location_outlined);
                },
                child: const Text("Search"),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
