import 'package:realtime_climate_tracker/services/networking.dart';
import 'package:http/http.dart';
import 'package:realtime_climate_tracker/services/location.dart';

class WeatherModel {

   Future<dynamic> getLocationWeather()async{
     Location location = Location();
     await location.get_location();


     NetworkHelper networkHelper = NetworkHelper(
         'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=3b30798fa8f780395c0023f2b0ac8057&units=metric');

     var weatherData = await networkHelper.getData();
     return weatherData;
   }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
