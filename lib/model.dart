class WeatherModel {
  String? name;
  TempInfo? temp;
  TempInfo? humidity;
  WeatherInfo? description;
  SpeedInfo? wind;

  String get iconUrl {
    return "https://openweathermap.org/img/wn/${description!.icons}@2x.png";
  }

  WeatherModel(
      {this.name, this.temp, this.humidity, this.description, this.wind});

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    //temp
    final tempInfoJson = json['main'];
    final temp = TempInfo.fromJson(tempInfoJson);
    //humidity
    final humidityInfoJson = json['main'];
    final humidity = TempInfo.fromJson(humidityInfoJson);

    //description
    final descriptionInfoJson = json['weather'][0];
    final description = WeatherInfo.fromJson(descriptionInfoJson);
    // wind=> speed
    final speedInfoJson = json['wind'];
    final wind = SpeedInfo.fromJson(speedInfoJson);

    return WeatherModel(
        name: name,
        temp: temp,
        humidity: humidity,
        description: description,
        wind: wind);
  }
}

class TempInfo {
  double? temperature;
  double? humid;
  TempInfo({this.temperature, this.humid});

  factory TempInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json['temp'];
    final humid = json['humidity'];

    return TempInfo(temperature: temperature, humid: humid);
  }
}

class WeatherInfo {
  final String? icons;
  final String? desc;
  WeatherInfo({this.icons, this.desc});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final desc = json['description'];
    final icons = json['icon'];

    return WeatherInfo(desc: desc, icons: icons);
  }
}

class SpeedInfo {
  double? speed;
  SpeedInfo({this.speed});

  factory SpeedInfo.fromJson(Map<String, dynamic> json) {
    final speed = json['speed'];

    return SpeedInfo(speed: speed);
  }
}
