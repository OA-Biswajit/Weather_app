import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:weather_app/src/model/weather_model.dart';

class repo {
  String city = " ";
  fetchWeatherInfo({city}) async {
    try {
      var response = await https.get(Uri.parse(
          "http://api.openweathermap.org/data/2.5/weather?q=$city&appid=ac244764e38460bdd143f804ed1840f8"));

      var decodedJson = await jsonDecode(response.body);
    }
    // try {
    //   if ((response).statusCode == 200) {
    //     return Weather_modal.fromJson(jsonDecode(response.body));
    //   }

    // }
    catch (e) {
      throw Exception();
    }
  }
}
