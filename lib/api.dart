import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:wassa_weather/model.dart';

class weatherApi {
  /*
  Future<WeatherModel>? CurrentWeather({String? location = "Paris"}) async {
    var point = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=3efb52f603c5accfb1001274e13e58a7&units=metric");

    var response = await http.get(point);
    var body = jsonDecode(response.body);
    var resultat = WeatherModel.fromJson(body).main!.temp;
    print(resultat);
    return WeatherModel.fromJson(body);
  }*/
  Future<WeatherModel>? CurrentWeather(String? location) async {
    final queryParameters = {
      'q': location,
      'appid': '6d694fdacb8a8655ce72b5bfc3d89159',
      'units': 'metric'
    };
    final uri = Uri.https(
        'api.openweathermap.org.', '/data/2.5/weather', queryParameters);
    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    return WeatherModel.fromJson(json);
  }
}
