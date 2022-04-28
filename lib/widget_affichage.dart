import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:wassa_weather/error.dart';
import 'package:wassa_weather/model.dart';

class Demo extends StatefulWidget {
  const Demo({Key? key, required this.text}) : super(key: key);
  final text;
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  WeatherModel? _response;
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Wassa Weather",
          style: TextStyle(
              fontFamily: 'ciao',
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: FutureBuilder<WeatherModel>(
        future: CurrentWeather(widget.text),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            String img;

            if (snapshot.data!.description!.icons == "01d" ||
                snapshot.data!.description!.icons == "02d") {
              img = "sunny.jpg";
            } else if (snapshot.data!.description!.icons == "01n" ||
                snapshot.data!.description!.icons == "03n") {
              img = "night.jpg.";
            } else if (snapshot.data!.description!.icons == "03d" ||
                snapshot.data!.description!.icons == "04d") {
              img = "cloudySunny.jpg";
            } else if (snapshot.data!.description!.icons == "02n" ||
                snapshot.data!.description!.icons == "04n") {
              img = "cloudy.jpeg.";
            } else if (snapshot.data!.description!.icons == "09d" ||
                snapshot.data!.description!.icons == "10d" ||
                snapshot.data!.description!.icons == "11d" ||
                snapshot.data!.description!.icons == "09n" ||
                snapshot.data!.description!.icons == "10n" ||
                snapshot.data!.description!.icons == "11n") {
              img = "rainy.jpg";
            } else {
              img = "neige.jpg";
            }

            return Container(
              child: Stack(
                children: [
                  Image.asset(
                    img,
                    //prendre tout l'espacement
                    fit: BoxFit.cover,

                    //ça prendre tout les espace
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: const BoxDecoration(color: Colors.black38),
                  ),
                  Container(
                    //espace entre le nom Location à gauche
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      //mettre les widgets  aux extreme de l'espacement
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            //mettre les widgets  aux extreme de l'espacement
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 50,
                                  ),
                                  //  if (_response != null)
                                  Text(
                                    widget.text,
                                    style: GoogleFonts.lato(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    //'$now',
                                    "${date}",
                                    style: GoogleFonts.lato(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // "${_response!.temp!.temperature!.toStringAsFixed(0)}°C",
                                    "${snapshot.data!.temp!.temperature!.toStringAsFixed(0)}°C",
                                    style: GoogleFonts.lato(
                                        fontSize: 85,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 5.0,
                                  ),
                                  // if (_response != null)
                                  Row(
                                    children: [
                                      //l'icone qui designe le climent et le temps
                                      // if (_response != null)
                                      Image.network(
                                        // '${_response!.iconUrl}',
                                        snapshot.data!.iconUrl,
                                        width: 50,
                                        height: 50,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      if (snapshot.data!.description!.icons == "01d" ||
                                          snapshot.data!.description!.icons ==
                                              "02d" ||
                                          snapshot.data!.description!.icons ==
                                              "03d" ||
                                          snapshot.data!.description!.icons ==
                                              "04d" ||
                                          snapshot.data!.description!.icons ==
                                              "09d" ||
                                          snapshot.data!.description!.icons ==
                                              "10d" ||
                                          snapshot.data!.description!.icons ==
                                              "11d" ||
                                          snapshot.data!.description!.icons ==
                                              "12d" ||
                                          snapshot.data!.description!.icons ==
                                              "13d" ||
                                          snapshot.data!.description!.icons ==
                                              "50d") ...[
                                        Text(
                                          //'$now',
                                          "Day",
                                          style: GoogleFonts.lato(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ] else ...[
                                        Text(
                                          //'$now',
                                          "Night",
                                          style: GoogleFonts.lato(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                      ]
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 40),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.white30)),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Wind",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    //if (_response != null)
                                    Text(
                                      //'$now',

                                      // "${_response!.wind!.speed}",
                                      "${snapshot.data!.wind!.speed}",
                                      style: GoogleFonts.lato(
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      //'$now',
                                      "Km/h",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 5,
                                          width: 50,
                                          color: Colors.white38,
                                        ),
                                        Container(
                                          height: 5,
                                          width: 10,
                                          color: Colors.greenAccent,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "Description",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    //if (_response != null)
                                    Text(
                                      //'$now',
                                      // "${_response!.description!.desc}",
                                      "${snapshot.data!.description!.desc}",
                                      style: GoogleFonts.lato(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                //humidity
                                Column(
                                  children: [
                                    Text(
                                      "Humidity",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    //  if (_response != null)
                                    Text(
                                      //'$now',
                                      // "${_response!.humidity!.humid}",
                                      "${snapshot.data!.humidity!.humid}",
                                      style: GoogleFonts.lato(
                                          fontSize: 18,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      //'$now',
                                      "%",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    ),
                                    Stack(
                                      children: [
                                        Container(
                                          height: 5,
                                          width: 50,
                                          color: Colors.white38,
                                        ),
                                        Container(
                                          height: 5,
                                          width: 10,
                                          color: Colors.greenAccent,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return errorPage();
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

Future<WeatherModel> httpsRequest(String city) async {
  var dio = Dio();
  var response = await dio.get(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=3efb52f603c5accfb1001274e13e58a7&units=metric");

  var _weather = WeatherModel.fromJson(response.data);
  return _weather;
}

Future<WeatherModel> CurrentWeather(String location) async {
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
