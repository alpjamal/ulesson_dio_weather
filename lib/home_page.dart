import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ulesson_http/models/weather.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _temperature = 'No Data';

  _getWeather() async {
    String lat = '51.1043266';
    String lon = '71.1719492';
    String apiKey = '0640c5a69b9a4c9846aa4d66b1000420';
    String url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey';

    Dio dio = Dio();
    final result = await dio.get(url);
    var model = WeatherResponse.fromJson(result.data);

    _temperature = '${(model.main?.temp ?? 0).toStringAsFixed(0)} F';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Weather'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_temperature),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _getWeather();
        },
        child: const Icon(Icons.api),
      ),
    );
  }
}
