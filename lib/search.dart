import 'package:flutter/material.dart';
import 'package:wassa_weather/api.dart';
import 'package:wassa_weather/model.dart';
import 'package:wassa_weather/widget_affichage.dart';

class WeatherSearch extends StatefulWidget {
  const WeatherSearch({Key? key}) : super(key: key);

  @override
  _WeatherSearchState createState() => _WeatherSearchState();
}

class _WeatherSearchState extends State<WeatherSearch> {
  WeatherModel? _response;
  final _controller = TextEditingController();
  final service = weatherApi();
  String text = " ";

  void Dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "",
          style: TextStyle(
              fontFamily: 'ciao',
              color: Colors.blue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("search.jpg"),
                //mettre une couleur genre une mirage noire sur la photo ou le background
                colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
                fit: BoxFit.cover,
                alignment: Alignment.center),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(1.0),
                child: Text("Insert Location",
                    style: TextStyle(
                        //  fontFamily: 'ciao',

                        fontSize: 30,
                        color: Colors.white54,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic)),
              ),
              Padding(
                padding: const EdgeInsets.all(75),
                child: TextField(
                  controller: _controller,
                  /*  decoration: const InputDecoration(
                                    //fillColor: Colors.white,
                                    iconColor: Colors.white,
                                    fillColor: Colors.white38,
                                    filled: true,
                                    hoverColor: Colors.white,
                                    /*  hintText: "Search Location",
                                    hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.bold),*/
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.blue),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30.0),
                                      ),*/
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.orange),
                    ),
                    fillColor: Colors.white38,
                    filled: true,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(text,
                      style: const TextStyle(
                          //  fontFamily: 'ciao',

                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic)))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            text = _controller.text;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => Demo(
                  text: text,
                ),
              ),
            );
            _controller.clear();
          });
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
