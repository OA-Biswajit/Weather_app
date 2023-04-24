import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:weather_app/src/model/weather_model.dart';

class repo {
  fetchWeatherInfo(String city) async {
    var response = await https.get(
      
      Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=30bc1dae9d219aaa107f75ba1682a80c"),
    );
    var decodedJson = await jsonDecode(response.body);
    print(response);
    
    try {
      if ((response).statusCode == 200) {
        return Weather_modal.fromJson(jsonDecode(response.body));
      }
      
    }
     catch (e) {
      throw Exception();
    }
  }
}
