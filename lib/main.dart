import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wassa_weather/search.dart';

void main() {
  runApp(const weather());
}

class weather extends StatelessWidget {
  const weather({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather',
      home: WeatherSearch(),
    );
  }
}
