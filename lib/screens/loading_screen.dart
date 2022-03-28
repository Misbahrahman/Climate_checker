import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';
import 'package:realtime_climate_tracker/services/weather.dart';

import 'package:realtime_climate_tracker/services/networking.dart';

import 'package:realtime_climate_tracker/services/networking.dart';

const api_key = '3b30798fa8f780395c0023f2b0ac8057';
double latitude=0;
double longitude=0;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SpinKitFadingCircle(
            color: Colors.blue,
            size: 200,
          ),
        ],
      ),
    );
  }
}
