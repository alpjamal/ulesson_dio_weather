import 'package:dio/dio.dart';
import 'package:ulesson_http/models/weather.dart';

class WeatherRepo {
  final dio = Dio();

  Future<WeatherResponse> getWeather() async {
    String lat = '51.1043266';
    String lon = '71.1719492';
    String apiKey = '0640c5a69b9a4c9846aa4d66b1000420';
    String url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';

    final result = await dio.get(url);
    var model = WeatherResponse.fromJson(result.data);
    return model;
  }
}
