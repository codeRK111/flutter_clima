import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    test();
  }

  void test() async {
    Location location = Location();
    await location.getLocation();
    print(location.lat);
    getWeather(location.long, location.lat);
  }

  Future<Map<String, double>> getWeather(double lon, double lat) async {
    String url =
        'https://samples.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=2cc5ad56320f380098c64e5968925447';
    http.Response response = await http.get(url);
    var res = jsonDecode(response.body);

    print(res['coord']['lon']);
    print(response.body);
    return {'lon': res['coord']['lon'], 'lot': res['coord']['lat']};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Get the current location
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
