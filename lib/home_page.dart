import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ulesson_http/models/weather.dart';
import 'package:ulesson_http/reponsitory/weather_repository.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;
  WeatherResponse? weatherResponse;

  _getWeather() async {
    setState(() => _isLoading = true);
    weatherResponse = await WeatherRepo().getWeather();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Weather'),
      ),
      body: Center(
        child: _isLoading
            ? const CircularProgressIndicator.adaptive()
            : weatherResponse == null
                ? const Text('No Data')
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${weatherResponse!.main!.temp!.toStringAsFixed(0)} F'),
                      Text(weatherResponse!.name!),
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
